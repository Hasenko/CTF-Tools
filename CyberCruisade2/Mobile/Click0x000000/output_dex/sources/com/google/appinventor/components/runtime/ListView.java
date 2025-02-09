package com.google.appinventor.components.runtime;

import android.graphics.Paint;
import android.graphics.Rect;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.google.appinventor.components.annotations.DesignerComponent;
import com.google.appinventor.components.annotations.DesignerProperty;
import com.google.appinventor.components.annotations.Options;
import com.google.appinventor.components.annotations.PropertyCategory;
import com.google.appinventor.components.annotations.SimpleEvent;
import com.google.appinventor.components.annotations.SimpleFunction;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.SimpleProperty;
import com.google.appinventor.components.annotations.UsesLibraries;
import com.google.appinventor.components.annotations.UsesPermissions;
import com.google.appinventor.components.common.ComponentCategory;
import com.google.appinventor.components.common.LayoutType;
import com.google.appinventor.components.common.ListOrientation;
import com.google.appinventor.components.runtime.ListAdapterWithRecyclerView;
import com.google.appinventor.components.runtime.util.ElementsUtil;
import com.google.appinventor.components.runtime.util.ErrorMessages;
import com.google.appinventor.components.runtime.util.YailDictionary;
import com.google.appinventor.components.runtime.util.YailList;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@SimpleObject
@UsesPermissions(permissionNames = "android.permission.INTERNET,android.permission.READ_EXTERNAL_STORAGE")
@DesignerComponent(category = ComponentCategory.USERINTERFACE, description = "<p>This is a visible component that displays a list of text and image elements.</p> <p>Simple lists of strings may be set using the ElementsFromString property. More complex lists of elements containing multiple strings and/or images can be created using the ListData and ListViewLayout properties. </p>", iconName = "images/listView.png", nonVisible = ListView.DEFAULT_ENABLED, version = 9)
@UsesLibraries({"recyclerview.jar", "recyclerview.aar", "cardview.jar", "cardview.aar", "dynamicanimation.jar"})
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public final class ListView extends AndroidViewComponent {
    private static final int DEFAULT_BACKGROUND_COLOR = -16777216;
    private static final int DEFAULT_DIVIDER_SIZE = 0;
    private static final boolean DEFAULT_ENABLED = false;
    private static final int DEFAULT_IMAGE_WIDTH = 200;
    private static final int DEFAULT_MARGINS_SIZE = 0;
    private static final int DEFAULT_RADIUS = 0;
    private static final int DEFAULT_TEXT_SIZE = 22;
    private static final String LOG_TAG = "ListView";
    private int backgroundColor;
    private ListBounceEdgeEffectFactory bounceEdgeEffectFactory;
    private boolean bounceEffect;
    protected final ComponentContainer container;
    private int detailTextColor;
    private boolean divider;
    private int dividerColor;
    private Paint dividerPaint;
    private int dividerSize;
    private RecyclerView.EdgeEffectFactory edgeEffectFactory;
    private int elementColor;
    private boolean first;
    private float fontSizeDetail;
    private float fontSizeMain;
    private String fontTypeDetail;
    private String fontTypeface;
    private String hint;
    private int imageHeight;
    private int imageWidth;
    private List<Object> items;
    private int layout;
    private LinearLayoutManager layoutManager;
    private final android.widget.LinearLayout linearLayout;
    private ListAdapterWithRecyclerView listAdapterWithRecyclerView;
    private final android.widget.LinearLayout listLayout;
    private int margins;
    private boolean multiSelect;
    private int orientation;
    private String propertyValue;
    private int radius;
    private RecyclerView recyclerView;
    private String selection;
    private int selectionColor;
    private String selectionDetailText;
    private int selectionIndex;
    private boolean showFilter;
    private int textColor;
    private EditText txtSearchBox;

    public ListView(ComponentContainer container) {
        super(container);
        this.selectionDetailText = "Uninitialized";
        this.showFilter = DEFAULT_ENABLED;
        this.elementColor = 16777215;
        this.first = true;
        this.container = container;
        this.items = new ArrayList();
        android.widget.LinearLayout linearLayout = new android.widget.LinearLayout(container.$context());
        this.linearLayout = linearLayout;
        linearLayout.setOrientation(1);
        this.orientation = 0;
        this.layout = 0;
        this.recyclerView = new RecyclerView(container.$context());
        RecyclerView.LayoutParams params = new RecyclerView.LayoutParams(-1, -1);
        this.recyclerView.setLayoutParams(params);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(container.$context(), 1, DEFAULT_ENABLED);
        this.layoutManager = linearLayoutManager;
        this.recyclerView.setLayoutManager(linearLayoutManager);
        android.widget.LinearLayout linearLayout2 = new android.widget.LinearLayout(container.$context());
        this.listLayout = linearLayout2;
        LinearLayout.LayoutParams paramsList = new LinearLayout.LayoutParams(-1, -1);
        linearLayout2.setLayoutParams(paramsList);
        linearLayout2.setOrientation(1);
        this.dividerColor = -1;
        this.dividerSize = 0;
        this.margins = 0;
        this.edgeEffectFactory = this.recyclerView.getEdgeEffectFactory();
        this.bounceEdgeEffectFactory = new ListBounceEdgeEffectFactory();
        EditText editText = new EditText(container.$context());
        this.txtSearchBox = editText;
        editText.setSingleLine(true);
        this.txtSearchBox.setWidth(-2);
        this.txtSearchBox.setPadding(10, 10, 10, 10);
        HintText("Search list...");
        if (!AppInventorCompatActivity.isClassicMode()) {
            this.txtSearchBox.setBackgroundColor(-1);
        }
        if (container.$form().isDarkTheme()) {
            this.txtSearchBox.setTextColor(-16777216);
            this.txtSearchBox.setHintTextColor(-16777216);
        }
        this.txtSearchBox.addTextChangedListener(new TextWatcher() { // from class: com.google.appinventor.components.runtime.ListView.1
            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence cs, int arg1, int arg2, int arg3) {
                ListView.this.listAdapterWithRecyclerView.getFilter().filter(cs);
            }

            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence arg0, int arg1, int arg2, int arg3) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable arg0) {
            }
        });
        if (this.showFilter) {
            this.txtSearchBox.setVisibility(0);
        } else {
            this.txtSearchBox.setVisibility(8);
        }
        BackgroundColor(-16777216);
        SelectionColor(Component.COLOR_LTGRAY);
        TextColor(-1);
        TextColorDetail(-1);
        DividerColor(-1);
        DividerThickness(0);
        ElementMarginsWidth(0);
        FontSize(22.0f);
        FontSizeDetail(14.0f);
        FontTypeface(Component.TYPEFACE_DEFAULT);
        FontTypefaceDetail(Component.TYPEFACE_DEFAULT);
        ImageWidth(200);
        ImageHeight(200);
        ElementCornerRadius(0);
        MultiSelect(DEFAULT_ENABLED);
        BounceEdgeEffect(DEFAULT_ENABLED);
        ElementsFromString("");
        ListData("");
        linearLayout2.addView(this.recyclerView);
        linearLayout.addView(this.txtSearchBox);
        linearLayout.addView(linearLayout2);
        linearLayout.requestLayout();
        container.$add(this);
        Width(-2);
        ListViewLayout(0);
        SelectionIndex(0);
        setDivider();
    }

    @Override // com.google.appinventor.components.runtime.AndroidViewComponent
    public View getView() {
        return this.linearLayout;
    }

    @Override // com.google.appinventor.components.runtime.AndroidViewComponent, com.google.appinventor.components.runtime.VisibleComponent
    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "Determines the height of the list on the view.")
    public void Height(int height) {
        if (height == -1) {
            height = -2;
        }
        super.Height(height);
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "Sets hint on the filter bar.")
    @DesignerProperty(defaultValue = "Search list...", editorType = "string")
    public void HintText(String hint) {
        this.hint = hint;
        this.txtSearchBox.setHint(hint);
    }

    @SimpleProperty
    public String HintText() {
        return this.hint;
    }

    @Override // com.google.appinventor.components.runtime.AndroidViewComponent, com.google.appinventor.components.runtime.VisibleComponent
    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "Determines the width of the list on the view.")
    public void Width(int width) {
        if (width == -1) {
            width = -2;
        }
        super.Width(width);
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "False", editorType = "boolean")
    public void ShowFilterBar(boolean showFilter) {
        this.showFilter = showFilter;
        if (showFilter) {
            this.txtSearchBox.setVisibility(0);
        } else {
            this.txtSearchBox.setVisibility(8);
        }
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "List filter bar, allows to search the list for relevant items. True will display the bar, False will hide it.")
    public boolean ShowFilterBar() {
        return this.showFilter;
    }

    @SimpleProperty
    public void Elements(List<Object> itemsList) {
        this.items = new ArrayList(itemsList);
        updateAdapterData();
        this.listAdapterWithRecyclerView.notifyDataSetChanged();
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "List of elements to show in the ListView. Depending on the ListView, this may be a list of strings or a list of 3-element sub-lists containing Text, Description, and Image file name.")
    public List<Object> Elements() {
        return this.items;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "The TextView elements specified as a string with the stringItems separated by commas such as: Cheese,Fruit,Bacon,Radish. Each word before the comma will be an element in the list.")
    @DesignerProperty(defaultValue = "", editorType = "textArea")
    public void ElementsFromString(String itemstring) {
        this.items = new ArrayList(ElementsUtil.elementsListFromString(itemstring));
        updateAdapterData();
        this.listAdapterWithRecyclerView.notifyDataSetChanged();
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "The index of the currently selected item, starting at 1. If no item is selected, the value will be 0. If an attempt is made to set this to a number less than 1 or greater than the number of stringItems in the ListView, SelectionIndex will be set to 0, and Selection will be set to the empty text.")
    public int SelectionIndex() {
        return this.selectionIndex;
    }

    @SimpleProperty
    public void SelectionIndex(int index) {
        this.selectionIndex = index;
        if (index > 0 && index <= this.items.size()) {
            Object o = this.items.get(index - 1);
            if (o instanceof YailDictionary) {
                if (((YailDictionary) o).containsKey(Component.LISTVIEW_KEY_MAIN_TEXT)) {
                    this.selection = ((YailDictionary) o).get(Component.LISTVIEW_KEY_MAIN_TEXT).toString();
                    this.selectionDetailText = ElementsUtil.toStringEmptyIfNull(((YailDictionary) o).get(Component.LISTVIEW_KEY_DESCRIPTION));
                } else {
                    this.selection = o.toString();
                }
            } else {
                this.selection = o.toString();
            }
            if (this.multiSelect) {
                this.listAdapterWithRecyclerView.changeSelections(this.selectionIndex - 1);
                return;
            } else {
                this.listAdapterWithRecyclerView.toggleSelection(this.selectionIndex - 1);
                return;
            }
        }
        this.selection = "";
        this.listAdapterWithRecyclerView.clearSelections();
        this.listAdapterWithRecyclerView.notifyDataSetChanged();
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "The text value of the most recently selected item in the ListView.")
    public String Selection() {
        return this.selection;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "", editorType = "string")
    public void Selection(String value) {
        this.selection = value;
        if (!this.items.isEmpty()) {
            int i = 0;
            while (true) {
                if (i >= this.items.size()) {
                    break;
                }
                Object item = this.items.get(i);
                if (item instanceof YailDictionary) {
                    if (((YailDictionary) item).containsKey(Component.LISTVIEW_KEY_MAIN_TEXT)) {
                        if (((YailDictionary) item).get(Component.LISTVIEW_KEY_MAIN_TEXT).toString() == value) {
                            this.selectionIndex = i + 1;
                            this.selectionDetailText = ElementsUtil.toStringEmptyIfNull(((YailDictionary) item).get(Component.LISTVIEW_KEY_DESCRIPTION));
                            break;
                        } else {
                            this.selectionIndex = 0;
                            this.selectionDetailText = "Not Found";
                            i++;
                        }
                    } else if (item.toString().equals(value)) {
                        this.selectionIndex = i + 1;
                        break;
                    } else {
                        this.selectionIndex = 0;
                        i++;
                    }
                } else if (item.toString().equals(value)) {
                    this.selectionIndex = i + 1;
                    break;
                } else {
                    this.selectionIndex = 0;
                    i++;
                }
            }
            int i2 = this.selectionIndex;
            SelectionIndex(i2);
        }
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "Returns the secondary text of the selected row in the ListView.")
    public String SelectionDetailText() {
        return this.selectionDetailText;
    }

    @SimpleEvent(description = "Simple event to be raised after the an element has been chosen in the list. The selected element is available in the Selection property.")
    public void AfterPicking() {
        EventDispatcher.dispatchEvent(this, "AfterPicking", new Object[0]);
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The color of the listview background.")
    public int BackgroundColor() {
        return this.backgroundColor;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = Component.DEFAULT_VALUE_COLOR_BLACK, editorType = "color")
    public void BackgroundColor(int argb) {
        this.backgroundColor = argb;
        this.recyclerView.setBackgroundColor(argb);
        this.linearLayout.setBackgroundColor(this.backgroundColor);
        setAdapterData();
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The color of the listview background.")
    public int ElementColor() {
        return this.elementColor;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = Component.DEFAULT_VALUE_COLOR_NONE, editorType = "color")
    public void ElementColor(int argb) {
        this.elementColor = argb;
        setAdapterData();
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The color of the item when it is selected.")
    public int SelectionColor() {
        return this.selectionColor;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = Component.DEFAULT_VALUE_COLOR_LTGRAY, editorType = "color")
    public void SelectionColor(int argb) {
        this.selectionColor = argb;
        setAdapterData();
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The text color of the listview stringItems.")
    public int TextColor() {
        return this.textColor;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = Component.DEFAULT_VALUE_COLOR_WHITE, editorType = "color")
    public void TextColor(int argb) {
        this.textColor = argb;
        setAdapterData();
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The text color of DetailText of listview stringItems. ")
    public int TextColorDetail() {
        return this.detailTextColor;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = Component.DEFAULT_VALUE_COLOR_WHITE, editorType = "color")
    public void TextColorDetail(int argb) {
        this.detailTextColor = argb;
        setAdapterData();
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The text size of the listview items.")
    public int TextSize() {
        return Math.round(this.fontSizeMain);
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "22", editorType = "non_negative_integer")
    public void TextSize(int textSize) {
        if (textSize > 1000) {
            textSize = 999;
        }
        FontSize(Float.valueOf(textSize).floatValue());
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The text size of the listview stringItems.", userVisible = DEFAULT_ENABLED)
    public float FontSize() {
        return this.fontSizeMain;
    }

    @SimpleProperty
    public void FontSize(float fontSize) {
        if (fontSize > 1000.0f || fontSize < 1.0f) {
            this.fontSizeMain = 999.0f;
        } else {
            this.fontSizeMain = fontSize;
        }
        setAdapterData();
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The text size of the listview stringItems.")
    public float FontSizeDetail() {
        return this.fontSizeDetail;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "14.0", editorType = "non_negative_float")
    public void FontSizeDetail(float fontSize) {
        if (fontSize > 1000.0f || fontSize < 1.0f) {
            this.fontSizeDetail = 999.0f;
        } else {
            this.fontSizeDetail = fontSize;
        }
        setAdapterData();
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, userVisible = DEFAULT_ENABLED)
    public String FontTypeface() {
        return this.fontTypeface;
    }

    @SimpleProperty(userVisible = DEFAULT_ENABLED)
    @DesignerProperty(defaultValue = Component.TYPEFACE_DEFAULT, editorType = "typeface")
    public void FontTypeface(String typeface) {
        this.fontTypeface = typeface;
        setAdapterData();
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, userVisible = DEFAULT_ENABLED)
    public String FontTypefaceDetail() {
        return this.fontTypeDetail;
    }

    @SimpleProperty(userVisible = DEFAULT_ENABLED)
    @DesignerProperty(defaultValue = Component.TYPEFACE_DEFAULT, editorType = "typeface")
    public void FontTypefaceDetail(String typeface) {
        this.fontTypeDetail = typeface;
        setAdapterData();
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The image width of the listview image.")
    public int ImageWidth() {
        return this.imageWidth;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "200", editorType = "non_negative_integer")
    public void ImageWidth(int width) {
        this.imageWidth = width;
        setAdapterData();
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The image height of the listview image stringItems.")
    public int ImageHeight() {
        return this.imageHeight;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "200", editorType = "non_negative_integer")
    public void ImageHeight(int height) {
        this.imageHeight = height;
        setAdapterData();
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "Selecting the text and image layout in the ListView element.")
    public int ListViewLayout() {
        return this.layout;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = Component.TYPEFACE_DEFAULT, editorType = "ListViewLayout")
    public void ListViewLayout(@Options(LayoutType.class) int value) {
        this.layout = value;
        setAdapterData();
    }

    public boolean MultiSelect() {
        return this.multiSelect;
    }

    public void MultiSelect(boolean multi) {
        if (this.selectionIndex > 0) {
            this.listAdapterWithRecyclerView.clearSelections();
            this.listAdapterWithRecyclerView.notifyDataSetChanged();
        }
        this.multiSelect = multi;
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "Specifies the layout's orientation (vertical, horizontal).")
    public int Orientation() {
        return this.orientation;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = Component.TYPEFACE_DEFAULT, editorType = "recyclerview_orientation")
    public void Orientation(@Options(ListOrientation.class) int orientation) {
        this.orientation = orientation;
        if (orientation != 1) {
            this.layoutManager.setOrientation(1);
        } else {
            this.layoutManager.setOrientation(0);
        }
        this.recyclerView.requestLayout();
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, userVisible = DEFAULT_ENABLED)
    public String ListData() {
        return this.propertyValue;
    }

    @SimpleProperty(userVisible = DEFAULT_ENABLED)
    @DesignerProperty(editorType = "ListViewAddData")
    public void ListData(String propertyValue) {
        this.propertyValue = propertyValue;
        if (propertyValue != null && !propertyValue.isEmpty() && !propertyValue.equals("[]")) {
            try {
                JSONArray arr = new JSONArray(propertyValue);
                this.items.clear();
                for (int i = 0; i < arr.length(); i++) {
                    JSONObject jsonItem = arr.getJSONObject(i);
                    YailDictionary yailItem = new YailDictionary();
                    if (jsonItem.has(Component.LISTVIEW_KEY_MAIN_TEXT)) {
                        yailItem.put(Component.LISTVIEW_KEY_MAIN_TEXT, jsonItem.getString(Component.LISTVIEW_KEY_MAIN_TEXT));
                        yailItem.put(Component.LISTVIEW_KEY_DESCRIPTION, jsonItem.has(Component.LISTVIEW_KEY_DESCRIPTION) ? jsonItem.getString(Component.LISTVIEW_KEY_DESCRIPTION) : "");
                        yailItem.put(Component.LISTVIEW_KEY_IMAGE, jsonItem.has(Component.LISTVIEW_KEY_IMAGE) ? jsonItem.getString(Component.LISTVIEW_KEY_IMAGE) : "");
                        this.items.add(yailItem);
                    }
                }
            } catch (JSONException e) {
                Log.e(LOG_TAG, "Malformed JSON in ListView.ListData", e);
                this.container.$form().dispatchErrorOccurredEvent(this, "ListView.ListData", 0, e.getMessage());
            }
            updateAdapterData();
            this.listAdapterWithRecyclerView.notifyDataSetChanged();
        }
    }

    @SimpleFunction(description = "Create a ListView entry. MainText is required. DetailText and ImageName are optional.")
    public YailDictionary CreateElement(String mainText, String detailText, String imageName) {
        YailDictionary dictItem = new YailDictionary();
        dictItem.put(Component.LISTVIEW_KEY_MAIN_TEXT, mainText);
        dictItem.put(Component.LISTVIEW_KEY_DESCRIPTION, detailText);
        dictItem.put(Component.LISTVIEW_KEY_IMAGE, imageName);
        return dictItem;
    }

    @SimpleFunction(description = "Get the Main Text of a ListView element.")
    public String GetMainText(YailDictionary listElement) {
        return listElement.get(Component.LISTVIEW_KEY_MAIN_TEXT).toString();
    }

    @SimpleFunction(description = "Get the Detail Text of a ListView element.")
    public String GetDetailText(YailDictionary listElement) {
        return listElement.get(Component.LISTVIEW_KEY_DESCRIPTION).toString();
    }

    @SimpleFunction(description = "Get the filename of the image of a ListView element that has been uploaded to Media.")
    public String GetImageName(YailDictionary listElement) {
        return listElement.get(Component.LISTVIEW_KEY_IMAGE).toString();
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The color of the list view divider.")
    public int DividerColor() {
        return this.dividerColor;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = Component.DEFAULT_VALUE_COLOR_WHITE, editorType = "color")
    public void DividerColor(int argb) {
        this.dividerColor = argb;
        Paint paint = new Paint();
        this.dividerPaint = paint;
        paint.setColor(argb);
        setDivider();
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The thickness of the element divider in the list view. If the thickness is 0, the divider is not visible.")
    public int DividerThickness() {
        return this.dividerSize;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = Component.TYPEFACE_DEFAULT, editorType = "non_negative_integer")
    public void DividerThickness(int size) {
        this.dividerSize = size;
        setDivider();
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The margins width of the list view element.")
    public int ElementMarginsWidth() {
        return this.margins;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = Component.TYPEFACE_DEFAULT, editorType = "non_negative_integer")
    public void ElementMarginsWidth(int width) {
        this.margins = width;
        setDivider();
    }

    @SimpleProperty(category = PropertyCategory.APPEARANCE, description = "The radius of the rounded corners of a list view item.")
    public int ElementCornerRadius() {
        return this.radius;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = Component.TYPEFACE_DEFAULT, editorType = "non_negative_integer")
    public void ElementCornerRadius(int radius) {
        this.radius = radius;
        setAdapterData();
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "The effect of bounce from the edge after scrolling the list to the end.  True will enable the bounce effect, false will disable it.")
    public boolean BounceEdgeEffect() {
        return this.bounceEffect;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "False", editorType = "boolean")
    public void BounceEdgeEffect(boolean bounce) {
        if (bounce) {
            this.recyclerView.setEdgeEffectFactory(this.bounceEdgeEffectFactory);
        } else {
            this.recyclerView.setEdgeEffectFactory(this.edgeEffectFactory);
        }
        this.bounceEffect = bounce;
    }

    @SimpleFunction(description = "Removes Item from list at a given index.")
    public void RemoveItemAtIndex(int index) {
        if (index < 1 || index > this.items.size()) {
            this.container.$form().dispatchErrorOccurredEvent(this, "RemoveItemAtIndex", ErrorMessages.ERROR_LISTVIEW_INDEX_OUT_OF_BOUNDS, Integer.valueOf(index));
            return;
        }
        this.items.remove(index - 1);
        updateAdapterData();
        this.listAdapterWithRecyclerView.notifyItemRemoved(index - 1);
    }

    @SimpleFunction(description = "Add new Item to list at the end.")
    public void AddItem(String mainText, String detailText, String imageName) {
        if (!this.items.isEmpty()) {
            Object o = this.items.get(0);
            if (o instanceof YailDictionary) {
                if (((YailDictionary) o).containsKey(Component.LISTVIEW_KEY_MAIN_TEXT)) {
                    this.items.add(CreateElement(mainText, detailText, imageName));
                } else {
                    this.items.add(mainText);
                }
            } else {
                this.items.add(mainText);
            }
        } else if (this.layout == 0) {
            this.items.add(mainText);
        } else {
            this.items.add(CreateElement(mainText, detailText, imageName));
        }
        updateAdapterData();
        this.listAdapterWithRecyclerView.notifyItemChanged(r0.getItemCount() - 1);
    }

    @SimpleFunction(description = "Add new Items to list at the end.")
    public void AddItems(List<Object> itemsList) {
        if (!itemsList.isEmpty()) {
            int positionStart = this.items.size();
            int itemCount = itemsList.size();
            this.items.addAll(itemsList);
            updateAdapterData();
            this.listAdapterWithRecyclerView.notifyItemRangeChanged(positionStart, itemCount);
        }
    }

    @SimpleFunction(description = "Add new Item to list at a given index.")
    public void AddItemAtIndex(int index, String mainText, String detailText, String imageName) {
        if (index < 1 || index > this.items.size() + 1) {
            this.container.$form().dispatchErrorOccurredEvent(this, "AddItemAtIndex", ErrorMessages.ERROR_LISTVIEW_INDEX_OUT_OF_BOUNDS, Integer.valueOf(index));
            return;
        }
        if (!this.items.isEmpty()) {
            Object o = this.items.get(0);
            if (o instanceof YailDictionary) {
                if (((YailDictionary) o).containsKey(Component.LISTVIEW_KEY_MAIN_TEXT)) {
                    this.items.add(index - 1, CreateElement(mainText, detailText, imageName));
                } else {
                    this.items.add(index - 1, mainText);
                }
            } else {
                this.items.add(index - 1, mainText);
            }
        } else if (this.layout == 0) {
            this.items.add(index - 1, mainText);
        } else {
            this.items.add(index - 1, CreateElement(mainText, detailText, imageName));
        }
        updateAdapterData();
        this.listAdapterWithRecyclerView.notifyItemInserted(index - 1);
    }

    @SimpleFunction(description = "Add new Items to list at specific index.")
    public void AddItemsAtIndex(int index, YailList itemsList) {
        if (index < 1 || index > this.items.size() + 1) {
            this.container.$form().dispatchErrorOccurredEvent(this, "AddItemsAtIndex", ErrorMessages.ERROR_LISTVIEW_INDEX_OUT_OF_BOUNDS, Integer.valueOf(index));
            return;
        }
        if (!itemsList.isEmpty()) {
            int positionStart = index - 1;
            int itemCount = itemsList.size();
            this.items.addAll(positionStart, itemsList);
            updateAdapterData();
            this.listAdapterWithRecyclerView.notifyItemRangeChanged(positionStart, itemCount);
        }
    }

    public void setAdapterData() {
        ListAdapterWithRecyclerView listAdapterWithRecyclerView = new ListAdapterWithRecyclerView(this.container, this.items, this.layout, this.textColor, this.detailTextColor, this.fontSizeMain, this.fontSizeDetail, this.fontTypeface, this.fontTypeDetail, this.elementColor, this.selectionColor, this.imageWidth, this.imageHeight, this.radius);
        this.listAdapterWithRecyclerView = listAdapterWithRecyclerView;
        listAdapterWithRecyclerView.setOnItemClickListener(new ListAdapterWithRecyclerView.ClickListener() { // from class: com.google.appinventor.components.runtime.ListView.2
            @Override // com.google.appinventor.components.runtime.ListAdapterWithRecyclerView.ClickListener
            public void onItemClick(int position, View v) {
                ListView.this.SelectionIndex(position + 1);
                ListView.this.AfterPicking();
            }
        });
        this.recyclerView.setAdapter(this.listAdapterWithRecyclerView);
    }

    public void updateAdapterData() {
        SelectionIndex(0);
        this.listAdapterWithRecyclerView.updateData(this.items);
    }

    private void setDivider() {
        DividerItemDecoration dividerDecoration = new DividerItemDecoration();
        int i = 0;
        while (true) {
            if (i >= this.recyclerView.getItemDecorationCount()) {
                break;
            }
            RecyclerView.ItemDecoration decoration = this.recyclerView.getItemDecorationAt(i);
            if (!(decoration instanceof DividerItemDecoration)) {
                i++;
            } else {
                this.recyclerView.removeItemDecorationAt(i);
                break;
            }
        }
        this.recyclerView.addItemDecoration(dividerDecoration);
    }

    private class DividerItemDecoration extends RecyclerView.ItemDecoration {
        public DividerItemDecoration() {
        }

        public void onDraw(android.graphics.Canvas canvas, RecyclerView parent, RecyclerView.State state) {
            if (ListView.this.margins == 0) {
                int childCount = parent.getChildCount();
                if (ListView.this.orientation == 1) {
                    for (int i = 0; i < childCount - 1; i++) {
                        View child = parent.getChildAt(i);
                        int position = parent.getChildAdapterPosition(child);
                        if (position != -1) {
                            int left = child.getRight();
                            int right = ListView.this.dividerSize + left;
                            int top = child.getTop();
                            int bottom = child.getBottom();
                            canvas.drawRect(left, top, right, bottom, ListView.this.dividerPaint);
                        }
                    }
                    return;
                }
                int width = parent.getWidth();
                for (int i2 = 0; i2 < childCount - 1; i2++) {
                    View child2 = parent.getChildAt(i2);
                    int position2 = parent.getChildAdapterPosition(child2);
                    if (position2 != -1) {
                        int top2 = child2.getBottom();
                        int bottom2 = ListView.this.dividerSize + top2;
                        canvas.drawRect(0.0f, top2, width, bottom2, ListView.this.dividerPaint);
                    }
                }
            }
        }

        public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
            int position = parent.getChildAdapterPosition(view);
            if (ListView.this.margins == 0) {
                if (position != -1 && position < parent.getAdapter().getItemCount() - 1) {
                    if (ListView.this.orientation == 1) {
                        outRect.set(0, 0, ListView.this.dividerSize, 0);
                        return;
                    } else {
                        outRect.set(0, 0, 0, ListView.this.dividerSize);
                        return;
                    }
                }
                outRect.setEmpty();
                return;
            }
            int column = position % 1;
            outRect.left = ListView.this.margins - ((ListView.this.margins * column) / 1);
            outRect.right = ((column + 1) * ListView.this.margins) / 1;
            if (position < 1 || ListView.this.first) {
                ListView.this.first = ListView.DEFAULT_ENABLED;
                outRect.top = ListView.this.margins;
            }
            outRect.bottom = ListView.this.margins;
        }
    }

    @SimpleFunction(description = "Reload the ListView to reflect any changes in the data.")
    @Deprecated
    public void Refresh() {
        setAdapterData();
    }
}
