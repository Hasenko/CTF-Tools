package androidx.core.provider;

import android.os.Handler;
import android.os.Process;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
class RequestExecutor {
    private RequestExecutor() {
    }

    static <T> void execute(Executor executor, Callable<T> callable, Consumer<T> consumer) {
        Handler calleeHandler = CalleeHandler.create();
        executor.execute(new ReplyRunnable(calleeHandler, callable, consumer));
    }

    static <T> T submit(ExecutorService executor, Callable<T> callable, int timeoutMillis) throws InterruptedException {
        Future<T> future = executor.submit(callable);
        try {
            return future.get(timeoutMillis, TimeUnit.MILLISECONDS);
        } catch (InterruptedException e) {
            throw e;
        } catch (ExecutionException e2) {
            throw new RuntimeException(e2);
        } catch (TimeoutException e3) {
            throw new InterruptedException("timeout");
        }
    }

    static ThreadPoolExecutor createDefaultExecutor(String threadName, int threadPriority, int keepAliveTimeInMillis) {
        ThreadFactory threadFactory = new DefaultThreadFactory(threadName, threadPriority);
        ThreadPoolExecutor executor = new ThreadPoolExecutor(0, 1, keepAliveTimeInMillis, TimeUnit.MILLISECONDS, new LinkedBlockingDeque(), threadFactory);
        executor.allowCoreThreadTimeOut(true);
        return executor;
    }

    static Executor createHandlerExecutor(Handler handler) {
        return new HandlerExecutor(handler);
    }

    private static class HandlerExecutor implements Executor {
        private final Handler mHandler;

        HandlerExecutor(Handler handler) {
            this.mHandler = (Handler) Preconditions.checkNotNull(handler);
        }

        @Override // java.util.concurrent.Executor
        public void execute(Runnable command) {
            if (!this.mHandler.post((Runnable) Preconditions.checkNotNull(command))) {
                throw new RejectedExecutionException(this.mHandler + " is shutting down");
            }
        }
    }

    private static class ReplyRunnable<T> implements Runnable {
        private Callable<T> mCallable;
        private Consumer<T> mConsumer;
        private Handler mHandler;

        ReplyRunnable(Handler handler, Callable<T> callable, Consumer<T> consumer) {
            this.mCallable = callable;
            this.mConsumer = consumer;
            this.mHandler = handler;
        }

        @Override // java.lang.Runnable
        public void run() {
            T t;
            try {
                t = this.mCallable.call();
            } catch (Exception e) {
                t = null;
            }
            final T result = t;
            final Consumer<T> consumer = this.mConsumer;
            this.mHandler.post(new Runnable() { // from class: androidx.core.provider.RequestExecutor.ReplyRunnable.1
                /* JADX WARN: Multi-variable type inference failed */
                @Override // java.lang.Runnable
                public void run() {
                    consumer.accept(result);
                }
            });
        }
    }

    private static class DefaultThreadFactory implements ThreadFactory {
        private int mPriority;
        private String mThreadName;

        DefaultThreadFactory(String threadName, int priority) {
            this.mThreadName = threadName;
            this.mPriority = priority;
        }

        @Override // java.util.concurrent.ThreadFactory
        public Thread newThread(Runnable runnable) {
            return new ProcessPriorityThread(runnable, this.mThreadName, this.mPriority);
        }

        private static class ProcessPriorityThread extends Thread {
            private final int mPriority;

            ProcessPriorityThread(Runnable target, String name, int priority) {
                super(target, name);
                this.mPriority = priority;
            }

            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                Process.setThreadPriority(this.mPriority);
                super.run();
            }
        }
    }
}
