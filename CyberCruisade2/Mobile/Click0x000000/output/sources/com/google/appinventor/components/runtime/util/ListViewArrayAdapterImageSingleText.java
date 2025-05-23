package com.google.appinventor.components.runtime.util;

import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Filter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.google.appinventor.components.runtime.Component;
import com.google.appinventor.components.runtime.ComponentContainer;
import java.io.IOException;
import java.util.List;

/* loaded from: classes.dex */
public class ListViewArrayAdapterImageSingleText {
    private ComponentContainer container;
    private List<YailDictionary> currentItems;
    private final Filter filter = new Filter() { // from class: com.google.appinventor.components.runtime.util.ListViewArrayAdapterImageSingleText.1
        @Override // android.widget.Filter
        protected Filter.FilterResults performFiltering(CharSequence charSequence) {
            String filterQuery = charSequence.toString().toLowerCase();
            Filter.FilterResults results = new Filter.FilterResults();
            if (filterQuery == null || filterQuery.length() == 0) {
                results.count = ListViewArrayAdapterImageSingleText.this.currentItems.size();
                results.values = ListViewArrayAdapterImageSingleText.this.currentItems;
            } else {
                ListViewArrayAdapterImageSingleText.this.filterCurrentItems.clear();
                for (YailDictionary item : ListViewArrayAdapterImageSingleText.this.currentItems) {
                    if (item.get(Component.LISTVIEW_KEY_MAIN_TEXT).toString().contains(filterQuery)) {
                        ListViewArrayAdapterImageSingleText.this.filterCurrentItems.add(item);
                    }
                }
                results.count = ListViewArrayAdapterImageSingleText.this.filterCurrentItems.size();
                results.values = ListViewArrayAdapterImageSingleText.this.filterCurrentItems;
            }
            return results;
        }

        @Override // android.widget.Filter
        protected void publishResults(CharSequence charSequence, Filter.FilterResults filterResults) {
            ListViewArrayAdapterImageSingleText.this.filterCurrentItems = (List) filterResults.values;
            ListViewArrayAdapterImageSingleText.this.itemAdapter.clear();
            for (YailDictionary item : ListViewArrayAdapterImageSingleText.this.filterCurrentItems) {
                ListViewArrayAdapterImageSingleText.this.itemAdapter.add(item);
            }
        }
    };
    private List<YailDictionary> filterCurrentItems;
    private int imageHeight;
    private int imageWidth;
    private ArrayAdapter<YailDictionary> itemAdapter;
    private int textColor;
    private int textSize;

    public ListViewArrayAdapterImageSingleText(int textSize, int textColor, int imageWidth, int imageHeight, ComponentContainer container, List<YailDictionary> items) {
        this.textSize = textSize;
        this.textColor = textColor;
        this.imageWidth = imageWidth;
        this.imageHeight = imageHeight;
        this.container = container;
        this.currentItems = items;
        this.filterCurrentItems = items;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public View createView() {
        LinearLayout linearLayout = new LinearLayout(this.container.$context());
        linearLayout.setOrientation(0);
        linearLayout.setPadding(15, 15, 15, 15);
        ImageView imageView = new ImageView(this.container.$context());
        imageView.setId(1);
        imageView.setLayoutParams(new LinearLayout.LayoutParams(this.imageWidth, this.imageHeight));
        TextView textView = new TextView(this.container.$context());
        textView.setPadding(15, 15, 15, 15);
        textView.setId(2);
        linearLayout.addView(imageView);
        linearLayout.addView(textView);
        return linearLayout;
    }

    public void setImage(ImageView imageView, String imagePath) {
        Drawable drawable = null;
        if (imagePath != "") {
            try {
                drawable = MediaUtil.getBitmapDrawable(this.container.$form(), imagePath);
            } catch (IOException e) {
                Log.e(Component.LISTVIEW_KEY_IMAGE, "Unable to load " + imagePath);
            }
        }
        ViewUtil.setImage(imageView, drawable);
    }

    public ArrayAdapter<YailDictionary> createAdapter() {
        ArrayAdapter<YailDictionary> arrayAdapter = new ArrayAdapter<YailDictionary>(this.container.$context(), 0, this.currentItems) { // from class: com.google.appinventor.components.runtime.util.ListViewArrayAdapterImageSingleText.2
            @Override // android.widget.ArrayAdapter, android.widget.Adapter
            public View getView(int position, View convertView, ViewGroup parent) {
                View view = ListViewArrayAdapterImageSingleText.this.createView();
                ImageView image = (ImageView) view.findViewById(1);
                TextView text1 = (TextView) view.findViewById(2);
                YailDictionary row = (YailDictionary) ListViewArrayAdapterImageSingleText.this.filterCurrentItems.get(position);
                String imageVal = ElementsUtil.toStringEmptyIfNull(row.get(Component.LISTVIEW_KEY_IMAGE));
                String val1 = ElementsUtil.toStringEmptyIfNull(row.get(Component.LISTVIEW_KEY_MAIN_TEXT));
                ListViewArrayAdapterImageSingleText.this.setImage(image, imageVal);
                text1.setText(val1);
                text1.setTextColor(ListViewArrayAdapterImageSingleText.this.textColor);
                text1.setTextSize(ListViewArrayAdapterImageSingleText.this.textSize);
                return view;
            }

            @Override // android.widget.ArrayAdapter, android.widget.Filterable
            public Filter getFilter() {
                return ListViewArrayAdapterImageSingleText.this.filter;
            }
        };
        this.itemAdapter = arrayAdapter;
        return arrayAdapter;
    }
}
