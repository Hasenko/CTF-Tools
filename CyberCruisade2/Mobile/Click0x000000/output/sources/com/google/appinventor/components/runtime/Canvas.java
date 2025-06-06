package com.google.appinventor.components.runtime;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import com.google.appinventor.components.annotations.Asset;
import com.google.appinventor.components.annotations.DesignerComponent;
import com.google.appinventor.components.annotations.DesignerProperty;
import com.google.appinventor.components.annotations.PropertyCategory;
import com.google.appinventor.components.annotations.SimpleEvent;
import com.google.appinventor.components.annotations.SimpleFunction;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.SimpleProperty;
import com.google.appinventor.components.annotations.UsesPermissions;
import com.google.appinventor.components.common.ComponentCategory;
import com.google.appinventor.components.common.PropertyTypeConstants;
import com.google.appinventor.components.runtime.collect.Sets;
import com.google.appinventor.components.runtime.errors.PermissionException;
import com.google.appinventor.components.runtime.errors.StopBlocksExecution;
import com.google.appinventor.components.runtime.util.BoundingBox;
import com.google.appinventor.components.runtime.util.ErrorMessages;
import com.google.appinventor.components.runtime.util.FileUtil;
import com.google.appinventor.components.runtime.util.FileWriteOperation;
import com.google.appinventor.components.runtime.util.MediaUtil;
import com.google.appinventor.components.runtime.util.PaintUtil;
import com.google.appinventor.components.runtime.util.ScopedFile;
import com.google.appinventor.components.runtime.util.SdkLevel;
import com.google.appinventor.components.runtime.util.Synchronizer;
import com.google.appinventor.components.runtime.util.YailList;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import kawa.lang.SyntaxForms;

@UsesPermissions(permissionNames = "android.permission.INTERNET")
@DesignerComponent(category = ComponentCategory.ANIMATION, description = "<p>A two-dimensional touch-sensitive rectangular panel on which drawing can be done and sprites can be moved.</p> <p>The <code>BackgroundColor</code>, <code>PaintColor</code>, <code>BackgroundImage</code>, <code>Width</code>, and <code>Height</code> of the Canvas can be set in either the Designer or in the Blocks Editor.  The <code>Width</code> and <code>Height</code> are measured in pixels and must be positive.</p><p>Any location on the Canvas can be specified as a pair of (X, Y) values, where <ul> <li>X is the number of pixels away from the left edge of the Canvas</li><li>Y is the number of pixels away from the top edge of the Canvas</li></ul>.</p> <p>There are events to tell when and where a Canvas has been touched or a <code>Sprite</code> (<code>ImageSprite</code> or <code>Ball</code>) has been dragged.  There are also methods for drawing points, lines, and circles.</p>", iconName = "images/canvas.png", version = 15)
@SimpleObject
/* loaded from: classes.dex */
public final class Canvas extends AndroidViewComponent implements ComponentContainer {
    private static final int DEFAULT_BACKGROUND_COLOR = -1;
    private static final float DEFAULT_LINE_WIDTH = 2.0f;
    private static final int DEFAULT_PAINT_COLOR = -16777216;
    private static final int DEFAULT_TAP_THRESHOLD = 15;
    private static final int DEFAULT_TEXTALIGNMENT = 1;
    private static final int FLING_INTERVAL = 1000;
    private static final String LOG_TAG = "Canvas";
    private static final int MIN_WIDTH_HEIGHT = 1;
    private int backgroundColor;
    private String backgroundImagePath;
    private final Activity context;
    private boolean drawn;
    private boolean extendMovesOutsideCanvas;
    private final Set<ExtensionGestureDetector> extensionGestureDetectors;
    private Form form;
    private boolean havePermission;
    private final GestureDetector mGestureDetector;
    private final MotionEventParser motionEventParser;
    private final Paint paint;
    private int paintColor;
    private final List<Sprite> sprites;
    private int tapThreshold;
    private int textAlignment;
    private final CanvasView view;

    public interface ExtensionGestureDetector {
        boolean onTouchEvent(MotionEvent motionEvent);
    }

    class MotionEventParser {
        public static final int FINGER_HEIGHT = 24;
        public static final int FINGER_WIDTH = 24;
        private static final int HALF_FINGER_HEIGHT = 12;
        private static final int HALF_FINGER_WIDTH = 12;
        private static final int UNSET = -1;
        private final List<Sprite> draggedSprites = new ArrayList();
        private float startX = -1.0f;
        private float startY = -1.0f;
        private float lastX = -1.0f;
        private float lastY = -1.0f;
        private boolean isDrag = false;
        private boolean drag = false;

        MotionEventParser() {
        }

        void parse(MotionEvent event) {
            int width = Canvas.this.Width();
            int height = Canvas.this.Height();
            float x = Math.max(0.0f, ((int) event.getX()) / Canvas.this.$form().deviceDensity());
            float y = Math.max(0.0f, ((int) event.getY()) / Canvas.this.$form().deviceDensity());
            BoundingBox rect = new BoundingBox(Math.max(0, ((int) x) - 12), Math.max(0, ((int) y) - 12), Math.min(width - 1, ((int) x) + 12), Math.min(height - 1, ((int) y) + 12));
            switch (event.getAction()) {
                case 0:
                    this.draggedSprites.clear();
                    this.startX = x;
                    this.startY = y;
                    this.lastX = x;
                    this.lastY = y;
                    this.drag = false;
                    this.isDrag = false;
                    for (Sprite sprite : Canvas.this.sprites) {
                        if (sprite.Enabled() && sprite.Visible() && sprite.intersectsWith(rect)) {
                            this.draggedSprites.add(sprite);
                            sprite.TouchDown(this.startX, this.startY);
                        }
                    }
                    Canvas.this.TouchDown(this.startX, this.startY);
                    break;
                case 1:
                    if (!this.drag) {
                        boolean handled = false;
                        for (Sprite sprite2 : this.draggedSprites) {
                            if (sprite2.Enabled() && sprite2.Visible()) {
                                sprite2.Touched(x, y);
                                sprite2.TouchUp(x, y);
                                handled = true;
                            }
                        }
                        Canvas.this.Touched(x, y, handled);
                    } else {
                        for (Sprite sprite3 : this.draggedSprites) {
                            if (sprite3.Enabled() && sprite3.Visible()) {
                                sprite3.Touched(x, y);
                                sprite3.TouchUp(x, y);
                            }
                        }
                    }
                    Canvas.this.TouchUp(x, y);
                    this.drag = false;
                    this.startX = -1.0f;
                    this.startY = -1.0f;
                    this.lastX = -1.0f;
                    this.lastY = -1.0f;
                    break;
                case 2:
                    if (this.startX == -1.0f || this.startY == -1.0f || this.lastX == -1.0f || this.lastY == -1.0f) {
                        Log.w(Canvas.LOG_TAG, "In Canvas.MotionEventParser.parse(), an ACTION_MOVE was passed without a preceding ACTION_DOWN: " + event);
                    }
                    if (this.isDrag || Math.abs(x - this.startX) >= Canvas.this.tapThreshold || Math.abs(y - this.startY) >= Canvas.this.tapThreshold) {
                        this.isDrag = true;
                        this.drag = true;
                        if ((x > 0.0f && x <= width && y > 0.0f && y <= height) || Canvas.this.extendMovesOutsideCanvas) {
                            for (Sprite sprite4 : Canvas.this.sprites) {
                                if (!this.draggedSprites.contains(sprite4) && sprite4.Enabled() && sprite4.Visible() && sprite4.intersectsWith(rect)) {
                                    this.draggedSprites.add(sprite4);
                                }
                            }
                            boolean handled2 = false;
                            for (Sprite sprite5 : this.draggedSprites) {
                                if (sprite5.Enabled() && sprite5.Visible()) {
                                    sprite5.Dragged(this.startX, this.startY, this.lastX, this.lastY, x, y);
                                    handled2 = true;
                                }
                            }
                            Canvas.this.Dragged(this.startX, this.startY, this.lastX, this.lastY, x, y, handled2);
                            this.lastX = x;
                            this.lastY = y;
                            break;
                        }
                    }
                    break;
            }
        }
    }

    private final class CanvasView extends View {
        private BitmapDrawable backgroundDrawable;
        private Bitmap bitmap;
        private android.graphics.Canvas canvas;
        private Bitmap completeBitmap;
        private Bitmap scaledBackgroundBitmap;

        public CanvasView(Context context) {
            super(context);
            this.bitmap = Bitmap.createBitmap(32, 48, Bitmap.Config.ARGB_8888);
            this.canvas = new android.graphics.Canvas(this.bitmap);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public Bitmap createBitmap() {
            int width = getWidth();
            int height = getHeight();
            Bitmap currentBitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
            android.graphics.Canvas c = new android.graphics.Canvas(currentBitmap);
            layout(0, 0, width, height);
            draw(c);
            return currentBitmap;
        }

        @Override // android.view.View
        public void onDraw(android.graphics.Canvas canvas0) {
            this.completeBitmap = null;
            super.onDraw(canvas0);
            canvas0.drawBitmap(this.bitmap, 0.0f, 0.0f, (Paint) null);
            for (Sprite sprite : Canvas.this.sprites) {
                sprite.onDraw(canvas0);
            }
            Canvas.this.drawn = true;
        }

        @Override // android.view.View
        protected void onSizeChanged(int w, int h, int oldW, int oldH) {
            int oldBitmapWidth = this.bitmap.getWidth();
            int oldBitmapHeight = this.bitmap.getHeight();
            if (w != oldBitmapWidth || h != oldBitmapHeight) {
                Bitmap oldBitmap = this.bitmap;
                try {
                    Bitmap scaledBitmap = Bitmap.createScaledBitmap(oldBitmap, w, h, false);
                    if (scaledBitmap.isMutable()) {
                        this.bitmap = scaledBitmap;
                        this.canvas = new android.graphics.Canvas(this.bitmap);
                    } else {
                        this.bitmap = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
                        this.canvas = new android.graphics.Canvas(this.bitmap);
                        Rect src = new Rect(0, 0, oldBitmapWidth, oldBitmapHeight);
                        RectF dst = new RectF(0.0f, 0.0f, w, h);
                        this.canvas.drawBitmap(oldBitmap, src, dst, (Paint) null);
                    }
                } catch (IllegalArgumentException e) {
                    Log.e(Canvas.LOG_TAG, "Bad values to createScaledBimap w = " + w + ", h = " + h);
                }
                this.scaledBackgroundBitmap = null;
            }
        }

        @Override // android.view.View
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int preferredWidth;
            int preferredHeight;
            BitmapDrawable bitmapDrawable = this.backgroundDrawable;
            if (bitmapDrawable != null) {
                Bitmap bitmap = bitmapDrawable.getBitmap();
                preferredWidth = bitmap.getWidth();
                preferredHeight = bitmap.getHeight();
            } else {
                preferredWidth = 32;
                preferredHeight = 48;
            }
            setMeasuredDimension(getSize(widthMeasureSpec, preferredWidth), getSize(heightMeasureSpec, preferredHeight));
        }

        private int getSize(int measureSpec, int preferredSize) {
            int specMode = View.MeasureSpec.getMode(measureSpec);
            int specSize = View.MeasureSpec.getSize(measureSpec);
            if (specMode == 1073741824) {
                return specSize;
            }
            if (specMode != Integer.MIN_VALUE) {
                return preferredSize;
            }
            int result = Math.min(preferredSize, specSize);
            return result;
        }

        @Override // android.view.View
        public boolean onTouchEvent(MotionEvent event) {
            Canvas.this.container.$form().dontGrabTouchEventsForComponent();
            Canvas.this.motionEventParser.parse(event);
            Canvas.this.mGestureDetector.onTouchEvent(event);
            for (ExtensionGestureDetector g : Canvas.this.extensionGestureDetectors) {
                g.onTouchEvent(event);
            }
            return true;
        }

        void setBackgroundImage(String path) {
            Canvas.this.backgroundImagePath = path == null ? "" : path;
            this.backgroundDrawable = null;
            this.scaledBackgroundBitmap = null;
            if (!TextUtils.isEmpty(Canvas.this.backgroundImagePath)) {
                try {
                    this.backgroundDrawable = MediaUtil.getBitmapDrawable(Canvas.this.container.$form(), Canvas.this.backgroundImagePath);
                } catch (IOException e) {
                    Log.e(Canvas.LOG_TAG, "Unable to load " + Canvas.this.backgroundImagePath);
                }
            }
            setBackground();
            clearDrawingLayer();
        }

        void setBackgroundImageBase64(String imageUrl) {
            Canvas.this.backgroundImagePath = imageUrl == null ? "" : imageUrl;
            this.backgroundDrawable = null;
            this.scaledBackgroundBitmap = null;
            if (!TextUtils.isEmpty(Canvas.this.backgroundImagePath)) {
                byte[] decodedString = Base64.decode(Canvas.this.backgroundImagePath, 0);
                Bitmap decodedByte = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.length);
                this.backgroundDrawable = new BitmapDrawable(decodedByte);
            }
            setBackground();
            clearDrawingLayer();
        }

        private void setBackground() {
            Drawable setDraw;
            BitmapDrawable bitmapDrawable;
            BitmapDrawable bitmapDrawable2 = this.backgroundDrawable;
            if (Canvas.this.backgroundImagePath != "" && (bitmapDrawable = this.backgroundDrawable) != null) {
                setDraw = bitmapDrawable.getConstantState().newDrawable();
                setDraw.setColorFilter(Canvas.this.backgroundColor != 0 ? Canvas.this.backgroundColor : -1, PorterDuff.Mode.DST_OVER);
            } else {
                setDraw = new ColorDrawable(Canvas.this.backgroundColor != 0 ? Canvas.this.backgroundColor : -1);
            }
            setBackgroundDrawable(setDraw);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearDrawingLayer() {
            this.canvas.drawColor(0, PorterDuff.Mode.CLEAR);
            invalidate();
        }

        @Override // android.view.View
        public void setBackgroundColor(int color) {
            Canvas.this.backgroundColor = color;
            setBackground();
            clearDrawingLayer();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void drawTextAtAngle(String text, int x, int y, float angle) {
            this.canvas.save();
            this.canvas.rotate(-angle, x, y);
            this.canvas.drawText(text, x, y, Canvas.this.paint);
            this.canvas.restore();
            invalidate();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public int getBackgroundPixelColor(int x, int y) {
            if (x < 0 || x >= this.bitmap.getWidth() || y < 0 || y >= this.bitmap.getHeight()) {
                return 16777215;
            }
            try {
                int color = this.bitmap.getPixel(x, y);
                if (color != 0) {
                    return color;
                }
                BitmapDrawable bitmapDrawable = this.backgroundDrawable;
                if (bitmapDrawable != null) {
                    if (this.scaledBackgroundBitmap == null) {
                        this.scaledBackgroundBitmap = Bitmap.createScaledBitmap(bitmapDrawable.getBitmap(), this.bitmap.getWidth(), this.bitmap.getHeight(), false);
                    }
                    return this.scaledBackgroundBitmap.getPixel(x, y);
                }
                if (Color.alpha(Canvas.this.backgroundColor) == 0) {
                    return 16777215;
                }
                return Canvas.this.backgroundColor;
            } catch (IllegalArgumentException e) {
                Log.e(Canvas.LOG_TAG, String.format("Returning COLOR_NONE (exception) from getBackgroundPixelColor.", new Object[0]));
                return 16777215;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public int getPixelColor(int x, int y) {
            if (x < 0 || x >= this.bitmap.getWidth() || y < 0 || y >= this.bitmap.getHeight()) {
                return 16777215;
            }
            if (this.completeBitmap == null) {
                boolean anySpritesVisible = false;
                Iterator it = Canvas.this.sprites.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    Sprite sprite = (Sprite) it.next();
                    if (sprite.Visible()) {
                        anySpritesVisible = true;
                        break;
                    }
                }
                if (!anySpritesVisible) {
                    return getBackgroundPixelColor(x, y);
                }
                this.completeBitmap = createBitmap();
            }
            try {
                return this.completeBitmap.getPixel(x, y);
            } catch (IllegalArgumentException e) {
                Log.e(Canvas.LOG_TAG, String.format("Returning COLOR_NONE (exception) from getPixelColor.", new Object[0]));
                return 16777215;
            }
        }
    }

    public Canvas(ComponentContainer container) {
        super(container);
        this.backgroundImagePath = "";
        this.extendMovesOutsideCanvas = false;
        this.tapThreshold = 15;
        this.extensionGestureDetectors = Sets.newHashSet();
        this.form = $form();
        this.havePermission = false;
        Activity $context = container.$context();
        this.context = $context;
        this.view = new CanvasView($context);
        container.$add(this);
        Paint paint = new Paint();
        this.paint = paint;
        paint.setFlags(1);
        LineWidth(DEFAULT_LINE_WIDTH);
        PaintColor(-16777216);
        BackgroundColor(-1);
        TextAlignment(1);
        FontSize(14.0f);
        TapThreshold(15);
        this.sprites = new LinkedList();
        this.motionEventParser = new MotionEventParser();
        this.mGestureDetector = new GestureDetector($context, new FlingGestureListener());
        if (FileUtil.needsWritePermission(this.form.DefaultFileScope())) {
            this.havePermission = !this.form.isDeniedPermission("android.permission.WRITE_EXTERNAL_STORAGE");
        } else {
            this.havePermission = true;
        }
    }

    @Override // com.google.appinventor.components.runtime.AndroidViewComponent
    public View getView() {
        return this.view;
    }

    public Bitmap getBitmap() {
        return this.view.createBitmap();
    }

    public Activity getContext() {
        return this.context;
    }

    public void registerCustomGestureDetector(ExtensionGestureDetector detector) {
        this.extensionGestureDetectors.add(detector);
    }

    public void removeCustomGestureDetector(Object detector) {
        this.extensionGestureDetectors.remove(detector);
    }

    public boolean ready() {
        return this.drawn;
    }

    void addSprite(Sprite sprite) {
        for (int i = 0; i < this.sprites.size(); i++) {
            if (this.sprites.get(i).Z() > sprite.Z()) {
                this.sprites.add(i, sprite);
                return;
            }
        }
        this.sprites.add(sprite);
    }

    void removeSprite(Sprite sprite) {
        this.sprites.remove(sprite);
    }

    void changeSpriteLayer(Sprite sprite) {
        removeSprite(sprite);
        addSprite(sprite);
        this.view.invalidate();
    }

    @Override // com.google.appinventor.components.runtime.ComponentContainer
    public Activity $context() {
        return this.context;
    }

    @Override // com.google.appinventor.components.runtime.ComponentContainer
    public Form $form() {
        return this.container.$form();
    }

    @Override // com.google.appinventor.components.runtime.ComponentContainer
    public void $add(AndroidViewComponent component) {
        throw new UnsupportedOperationException("Canvas.$add() called");
    }

    @Override // com.google.appinventor.components.runtime.ComponentContainer
    public List<? extends Component> getChildren() {
        return this.sprites;
    }

    @Override // com.google.appinventor.components.runtime.ComponentContainer
    public void setChildWidth(AndroidViewComponent component, int width) {
        throw new UnsupportedOperationException("Canvas.setChildWidth() called");
    }

    @Override // com.google.appinventor.components.runtime.ComponentContainer
    public void setChildHeight(AndroidViewComponent component, int height) {
        throw new UnsupportedOperationException("Canvas.setChildHeight() called");
    }

    void registerChange(Sprite sprite) {
        this.view.invalidate();
        findSpriteCollisions(sprite);
    }

    protected void findSpriteCollisions(Sprite movedSprite) {
        for (Sprite sprite : this.sprites) {
            if (sprite != movedSprite) {
                if (movedSprite.CollidingWith(sprite)) {
                    if (!movedSprite.Visible() || !movedSprite.Enabled() || !sprite.Visible() || !sprite.Enabled() || !Sprite.colliding(sprite, movedSprite)) {
                        movedSprite.NoLongerCollidingWith(sprite);
                        sprite.NoLongerCollidingWith(movedSprite);
                    }
                } else if (movedSprite.Visible() && movedSprite.Enabled() && sprite.Visible() && sprite.Enabled() && Sprite.colliding(sprite, movedSprite)) {
                    movedSprite.CollidedWith(sprite);
                    sprite.CollidedWith(movedSprite);
                }
            }
        }
    }

    @Override // com.google.appinventor.components.runtime.AndroidViewComponent, com.google.appinventor.components.runtime.VisibleComponent
    @SimpleProperty
    public void Width(int width) {
        if (width > 0 || width == -2 || width == -1 || width <= -1000) {
            super.Width(width);
        } else {
            this.container.$form().dispatchErrorOccurredEvent(this, "Width", 1002, new Object[0]);
        }
    }

    @Override // com.google.appinventor.components.runtime.AndroidViewComponent, com.google.appinventor.components.runtime.VisibleComponent
    @SimpleProperty
    public void Height(int height) {
        if (height > 0 || height == -2 || height == -1 || height <= -1000) {
            super.Height(height);
        } else {
            this.container.$form().dispatchErrorOccurredEvent(this, "Height", 1003, new Object[0]);
        }
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The color of the canvas background.")
    public int BackgroundColor() {
        return this.backgroundColor;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = Component.DEFAULT_VALUE_COLOR_WHITE, editorType = PropertyTypeConstants.PROPERTY_TYPE_COLOR)
    public void BackgroundColor(int argb) {
        this.view.setBackgroundColor(argb);
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The name of a file containing the background image for the canvas")
    public String BackgroundImage() {
        return this.backgroundImagePath;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "", editorType = PropertyTypeConstants.PROPERTY_TYPE_ASSET)
    public void BackgroundImage(@Asset String path) {
        this.view.setBackgroundImage(path);
    }

    @SimpleProperty(description = "Set the background image in Base64 format. This requires API level >= 8. For devices with API level less than 8, setting this will end up with an empty background.")
    public void BackgroundImageinBase64(String imageUrl) {
        if (SdkLevel.getLevel() >= 8) {
            this.view.setBackgroundImageBase64(imageUrl);
        } else {
            this.view.setBackgroundImageBase64("");
        }
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "Set the number of pixels right, left, up or down, a sequence of drags mustmove from the starting point to be considered a drag (instead of a touch).")
    public int TapThreshold() {
        return this.tapThreshold;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "15", editorType = PropertyTypeConstants.PROPERTY_TYPE_INTEGER)
    public void TapThreshold(int threshold) {
        this.tapThreshold = threshold;
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The color in which lines are drawn")
    public int PaintColor() {
        return this.paintColor;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = Component.DEFAULT_VALUE_COLOR_BLACK, editorType = PropertyTypeConstants.PROPERTY_TYPE_COLOR)
    public void PaintColor(int argb) {
        this.paintColor = argb;
        changePaint(this.paint, argb);
    }

    private void changePaint(Paint paint, int argb) {
        if (argb == 0) {
            PaintUtil.changePaint(paint, -16777216);
        } else if (argb == 16777215) {
            PaintUtil.changePaintTransparent(paint);
        } else {
            PaintUtil.changePaint(paint, argb);
        }
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The font size of text drawn on the canvas.")
    public float FontSize() {
        float scale = $form().deviceDensity();
        return this.paint.getTextSize() / scale;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "14.0", editorType = PropertyTypeConstants.PROPERTY_TYPE_NON_NEGATIVE_FLOAT)
    public void FontSize(float size) {
        float scale = $form().deviceDensity();
        this.paint.setTextSize(size * scale);
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The width of lines drawn on the canvas.")
    public float LineWidth() {
        return this.paint.getStrokeWidth() / $form().deviceDensity();
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "2.0", editorType = PropertyTypeConstants.PROPERTY_TYPE_NON_NEGATIVE_FLOAT)
    public void LineWidth(float width) {
        this.paint.setStrokeWidth($form().deviceDensity() * width);
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "Determines the alignment of the text drawn by DrawText() or DrawAngle() with respect to the point specified by that command: point at the left of the text, point at the center of the text, or point at the right of the text.", userVisible = SyntaxForms.DEBUGGING)
    public int TextAlignment() {
        return this.textAlignment;
    }

    @SimpleProperty(userVisible = SyntaxForms.DEBUGGING)
    @DesignerProperty(defaultValue = Component.TYPEFACE_SANSSERIF, editorType = PropertyTypeConstants.PROPERTY_TYPE_TEXTALIGNMENT)
    public void TextAlignment(int alignment) {
        this.textAlignment = alignment;
        switch (alignment) {
            case 0:
                this.paint.setTextAlign(Paint.Align.LEFT);
                break;
            case 1:
                this.paint.setTextAlign(Paint.Align.CENTER);
                break;
            case 2:
                this.paint.setTextAlign(Paint.Align.RIGHT);
                break;
        }
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "Determines whether moves can extend beyond the canvas borders.   Default is false. This should normally be false, and the property is provided for backwards compatibility.", userVisible = SyntaxForms.DEBUGGING)
    public boolean ExtendMovesOutsideCanvas() {
        return this.extendMovesOutsideCanvas;
    }

    @SimpleProperty(userVisible = SyntaxForms.DEBUGGING)
    @DesignerProperty(defaultValue = "False", editorType = PropertyTypeConstants.PROPERTY_TYPE_BOOLEAN)
    public void ExtendMovesOutsideCanvas(boolean extend) {
        this.extendMovesOutsideCanvas = extend;
    }

    @SimpleEvent
    public void Touched(float x, float y, boolean touchedAnySprite) {
        EventDispatcher.dispatchEvent(this, "Touched", Float.valueOf(x), Float.valueOf(y), Boolean.valueOf(touchedAnySprite));
    }

    @SimpleEvent
    public void TouchDown(float x, float y) {
        EventDispatcher.dispatchEvent(this, "TouchDown", Float.valueOf(x), Float.valueOf(y));
    }

    @SimpleEvent
    public void TouchUp(float x, float y) {
        EventDispatcher.dispatchEvent(this, "TouchUp", Float.valueOf(x), Float.valueOf(y));
    }

    @SimpleEvent
    public void Flung(float x, float y, float speed, float heading, float xvel, float yvel, boolean flungSprite) {
        EventDispatcher.dispatchEvent(this, "Flung", Float.valueOf(x), Float.valueOf(y), Float.valueOf(speed), Float.valueOf(heading), Float.valueOf(xvel), Float.valueOf(yvel), Boolean.valueOf(flungSprite));
    }

    @SimpleEvent
    public void Dragged(float startX, float startY, float prevX, float prevY, float currentX, float currentY, boolean draggedAnySprite) {
        EventDispatcher.dispatchEvent(this, "Dragged", Float.valueOf(startX), Float.valueOf(startY), Float.valueOf(prevX), Float.valueOf(prevY), Float.valueOf(currentX), Float.valueOf(currentY), Boolean.valueOf(draggedAnySprite));
    }

    @SimpleFunction(description = "Clears anything drawn on this Canvas but not any background color or image.")
    public void Clear() {
        this.view.clearDrawingLayer();
    }

    @SimpleFunction
    public void DrawPoint(int x, int y) {
        float correctedX = x * $form().deviceDensity();
        float correctedY = y * $form().deviceDensity();
        this.view.canvas.drawPoint(correctedX, correctedY, this.paint);
        this.view.invalidate();
    }

    @SimpleFunction
    public void DrawCircle(int centerX, int centerY, float radius, boolean fill) {
        float correctedX = centerX * $form().deviceDensity();
        float correctedY = centerY * $form().deviceDensity();
        float correctedR = $form().deviceDensity() * radius;
        Paint p = new Paint(this.paint);
        p.setStyle(fill ? Paint.Style.FILL : Paint.Style.STROKE);
        this.view.canvas.drawCircle(correctedX, correctedY, correctedR, p);
        this.view.invalidate();
    }

    @SimpleFunction
    public void DrawLine(int x1, int y1, int x2, int y2) {
        float correctedX1 = x1 * $form().deviceDensity();
        float correctedY1 = y1 * $form().deviceDensity();
        float correctedX2 = x2 * $form().deviceDensity();
        float correctedY2 = y2 * $form().deviceDensity();
        this.view.canvas.drawLine(correctedX1, correctedY1, correctedX2, correctedY2, this.paint);
        this.view.invalidate();
    }

    @SimpleFunction(description = "Draws a shape on the canvas. pointList should be a list contains sub-lists with two number which represents a coordinate. The first point and last point does not need to be the same. e.g. ((x1 y1) (x2 y2) (x3 y3)) When fill is true, the shape will be filled.")
    public void DrawShape(YailList pointList, boolean fill) {
        try {
            Path path = parsePath(parsePointList(pointList));
            path.close();
            Paint p = new Paint(this.paint);
            p.setStyle(fill ? Paint.Style.FILL : Paint.Style.STROKE);
            this.view.canvas.drawPath(path, p);
            this.view.invalidate();
        } catch (IllegalArgumentException e) {
            $form().dispatchErrorOccurredEvent(this, "DrawShape", 1004, new Object[0]);
        }
    }

    private Path parsePath(float[][] points) throws IllegalArgumentException {
        if (points == null || points.length == 0) {
            throw new IllegalArgumentException();
        }
        float scalingFactor = $form().deviceDensity();
        Path path = new Path();
        path.moveTo(points[0][0] * scalingFactor, points[0][1] * scalingFactor);
        for (int i = 1; i < points.length; i++) {
            path.lineTo(points[i][0] * scalingFactor, points[i][1] * scalingFactor);
        }
        return path;
    }

    private float[][] parsePointList(YailList pointList) throws IllegalArgumentException {
        if (pointList == null || pointList.size() == 0) {
            throw new IllegalArgumentException();
        }
        float[][] points = (float[][]) Array.newInstance((Class<?>) Float.TYPE, pointList.size(), 2);
        int index = 0;
        for (Object pointObject : pointList.toArray()) {
            if (pointObject instanceof YailList) {
                YailList pointYailList = (YailList) pointObject;
                if (pointYailList.size() == 2) {
                    try {
                        points[index][0] = Float.parseFloat(pointYailList.getString(0));
                        points[index][1] = Float.parseFloat(pointYailList.getString(1));
                        index++;
                    } catch (NullPointerException e) {
                        throw new IllegalArgumentException(e.fillInStackTrace());
                    } catch (NumberFormatException e2) {
                        throw new IllegalArgumentException(e2.fillInStackTrace());
                    }
                } else {
                    throw new IllegalArgumentException("length of item YailList(" + index + ") is not 2");
                }
            } else {
                throw new IllegalArgumentException("item(" + index + ") in YailList is not a YailList");
            }
        }
        return points;
    }

    @SimpleFunction(description = "Draw an arc on Canvas, by drawing an arc from a specified oval (specified by left, top, right & bottom). Start angle is 0 when heading to the right, and increase when rotate clockwise. When useCenter is true, a sector will be drawed instead of an arc. When fill is true, a filled arc (or sector) will be drawed instead of just an outline.")
    public void DrawArc(int left, int top, int right, int bottom, float startAngle, float sweepAngle, boolean useCenter, boolean fill) {
        float scalingFactor = $form().deviceDensity();
        Paint p = new Paint(this.paint);
        p.setStyle(fill ? Paint.Style.FILL : Paint.Style.STROKE);
        this.view.canvas.drawArc(new RectF(left * scalingFactor, top * scalingFactor, right * scalingFactor, bottom * scalingFactor), startAngle, sweepAngle, useCenter, p);
        this.view.invalidate();
    }

    @SimpleFunction(description = "Draws the specified text relative to the specified coordinates using the values of the FontSize and TextAlignment properties.")
    public void DrawText(String text, int x, int y) {
        float fontScalingFactor = $form().deviceDensity();
        float correctedX = x * fontScalingFactor;
        float correctedY = y * fontScalingFactor;
        this.view.canvas.drawText(text, correctedX, correctedY, this.paint);
        this.view.invalidate();
    }

    @SimpleFunction(description = "Draws the specified text starting at the specified coordinates at the specified angle using the values of the FontSize and TextAlignment properties.")
    public void DrawTextAtAngle(String text, int x, int y, float angle) {
        int correctedX = (int) (x * $form().deviceDensity());
        int correctedY = (int) (y * $form().deviceDensity());
        this.view.drawTextAtAngle(text, correctedX, correctedY, angle);
    }

    @SimpleFunction(description = "Gets the color of the specified point. This includes the background and any drawn points, lines, or circles but not sprites.")
    public int GetBackgroundPixelColor(int x, int y) {
        int correctedX = (int) (x * $form().deviceDensity());
        int correctedY = (int) (y * $form().deviceDensity());
        return this.view.getBackgroundPixelColor(correctedX, correctedY);
    }

    @SimpleFunction(description = "Sets the color of the specified point. This differs from DrawPoint by having an argument for color.")
    public void SetBackgroundPixelColor(int x, int y, int color) {
        Paint pixelPaint = new Paint();
        PaintUtil.changePaint(pixelPaint, color);
        int correctedX = (int) (x * $form().deviceDensity());
        int correctedY = (int) (y * $form().deviceDensity());
        this.view.canvas.drawPoint(correctedX, correctedY, pixelPaint);
        this.view.invalidate();
    }

    @SimpleFunction(description = "Gets the color of the specified point.")
    public int GetPixelColor(int x, int y) {
        int correctedX = (int) (x * $form().deviceDensity());
        int correctedY = (int) (y * $form().deviceDensity());
        return this.view.getPixelColor(correctedX, correctedY);
    }

    @SimpleFunction(description = "Saves a picture of this Canvas to the device's external storage. If an error occurs, the Screen's ErrorOccurred event will be called.")
    @UsesPermissions({"android.permission.WRITE_EXTERNAL_STORAGE"})
    public String Save() {
        return saveFile(FileUtil.getScopedPictureFile($form(), "png"), Bitmap.CompressFormat.PNG, "Save");
    }

    @SimpleFunction(description = "Saves a picture of this Canvas to the device's external storage in the file named fileName. fileName must end with one of .jpg, .jpeg, or .png, which determines the file type.")
    @UsesPermissions({"android.permission.WRITE_EXTERNAL_STORAGE"})
    public String SaveAs(String fileName) {
        Bitmap.CompressFormat format;
        if (fileName.endsWith(".jpg") || fileName.endsWith(".jpeg")) {
            format = Bitmap.CompressFormat.JPEG;
        } else if (fileName.endsWith(".png")) {
            format = Bitmap.CompressFormat.PNG;
        } else if (!fileName.contains(".")) {
            fileName = fileName + ".png";
            format = Bitmap.CompressFormat.PNG;
        } else {
            this.container.$form().dispatchErrorOccurredEvent(this, "SaveAs", ErrorMessages.ERROR_MEDIA_IMAGE_FILE_FORMAT, new Object[0]);
            return "";
        }
        return saveFile(new ScopedFile(this.form.DefaultFileScope(), fileName), format, "SaveAs");
    }

    private String saveFile(ScopedFile scopedFile, final Bitmap.CompressFormat format, String method) {
        if (!this.havePermission && FileUtil.needsWritePermission(scopedFile)) {
            this.form.askPermission("android.permission.WRITE_EXTERNAL_STORAGE", new PermissionResultHandler() { // from class: com.google.appinventor.components.runtime.Canvas.1
                @Override // com.google.appinventor.components.runtime.PermissionResultHandler
                public void HandlePermissionResponse(String permission, boolean granted) {
                    Canvas.this.havePermission = granted;
                }
            });
            throw new StopBlocksExecution();
        }
        final Synchronizer<Boolean> result = new Synchronizer<>();
        new FileWriteOperation(this.form, this, method, scopedFile, false, false) { // from class: com.google.appinventor.components.runtime.Canvas.2
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.appinventor.components.runtime.util.FileWriteOperation, com.google.appinventor.components.runtime.util.FileStreamOperation
            public boolean process(OutputStream stream) {
                Bitmap bitmap = Canvas.this.view.completeBitmap == null ? Canvas.this.view.createBitmap() : Canvas.this.view.completeBitmap;
                result.wakeup(Boolean.valueOf(bitmap.compress(format, 100, stream)));
                return true;
            }
        }.run();
        if (result.getThrowable() instanceof FileNotFoundException) {
            this.container.$form().dispatchErrorOccurredEvent(this, method, ErrorMessages.ERROR_MEDIA_CANNOT_OPEN, FileUtil.resolveFileName(this.form, scopedFile));
            return "";
        }
        if (result.getThrowable() instanceof IOException) {
            this.container.$form().dispatchErrorOccurredEvent(this, method, ErrorMessages.ERROR_MEDIA_FILE_ERROR, result.getThrowable().getMessage());
            return "";
        }
        if (result.getThrowable() instanceof PermissionException) {
            this.container.$form().dispatchPermissionDeniedEvent(this, method, (PermissionException) result.getThrowable());
            return "";
        }
        if (result.getThrowable() instanceof FileUtil.FileException) {
            this.container.$form().dispatchErrorOccurredEvent(this, method, ((FileUtil.FileException) result.getThrowable()).getErrorMessageNumber(), new Object[0]);
            return "";
        }
        if (result.getResult().booleanValue()) {
            return FileUtil.resolveFileName(this.form, scopedFile);
        }
        return "";
    }

    class FlingGestureListener extends GestureDetector.SimpleOnGestureListener {
        FlingGestureListener() {
        }

        /* JADX WARN: Incorrect condition in loop: B:3:0x009e */
        @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public boolean onFling(android.view.MotionEvent r30, android.view.MotionEvent r31, float r32, float r33) {
            /*
                Method dump skipped, instructions count: 216
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.appinventor.components.runtime.Canvas.FlingGestureListener.onFling(android.view.MotionEvent, android.view.MotionEvent, float, float):boolean");
        }
    }
}
