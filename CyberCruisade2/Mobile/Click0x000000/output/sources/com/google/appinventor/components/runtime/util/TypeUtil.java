package com.google.appinventor.components.runtime.util;

import com.google.appinventor.components.common.OptionList;
import com.google.appinventor.components.runtime.errors.DispatchableError;
import gnu.mapping.Symbol;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: classes.dex */
public final class TypeUtil {
    private TypeUtil() {
    }

    public static <T> T cast(Object o, Class<T> tClass, String expected) {
        if (o == null) {
            return null;
        }
        if (tClass.isInstance(o)) {
            return tClass.cast(o);
        }
        throw new DispatchableError(ErrorMessages.ERROR_INVALID_TYPE, o.getClass().getSimpleName(), expected);
    }

    public static <T> T castNotNull(Object obj, Class<T> cls, String str) {
        if (obj == null) {
            throw new DispatchableError(ErrorMessages.ERROR_INVALID_TYPE, "null", str);
        }
        return (T) cast(obj, cls, str);
    }

    public static <T> OptionList<T> castToEnum(T value, Symbol className) {
        String classNameStr = stripEnumSuffix(className.getName());
        try {
            Class<?> clazz = Class.forName(classNameStr);
            if (!OptionList.class.isAssignableFrom(clazz)) {
                throw new IllegalArgumentException(classNameStr + " does not identify an OptionList type.");
            }
            for (Method m : clazz.getMethods()) {
                if ("fromUnderlyingValue".equals(m.getName()) && m.getParameterTypes()[0].isAssignableFrom(value.getClass())) {
                    return (OptionList) m.invoke(clazz, value);
                }
            }
            return null;
        } catch (ClassNotFoundException e) {
            return null;
        } catch (IllegalAccessException e2) {
            return null;
        } catch (InvocationTargetException e3) {
            return null;
        }
    }

    private static String stripEnumSuffix(String className) {
        if (className.endsWith("Enum")) {
            return className.substring(0, className.length() - 4);
        }
        return className;
    }
}
