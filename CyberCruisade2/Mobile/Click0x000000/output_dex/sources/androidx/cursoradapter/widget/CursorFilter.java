package androidx.cursoradapter.widget;

import android.database.Cursor;
import android.widget.Filter;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
class CursorFilter extends Filter {
    CursorFilterClient mClient;

    interface CursorFilterClient {
        void changeCursor(Cursor cursor);

        CharSequence convertToString(Cursor cursor);

        Cursor getCursor();

        Cursor runQueryOnBackgroundThread(CharSequence charSequence);
    }

    CursorFilter(CursorFilterClient client) {
        this.mClient = client;
    }

    @Override // android.widget.Filter
    public CharSequence convertResultToString(Object resultValue) {
        return this.mClient.convertToString((Cursor) resultValue);
    }

    @Override // android.widget.Filter
    protected Filter.FilterResults performFiltering(CharSequence constraint) {
        Cursor cursor = this.mClient.runQueryOnBackgroundThread(constraint);
        Filter.FilterResults results = new Filter.FilterResults();
        if (cursor != null) {
            results.count = cursor.getCount();
            results.values = cursor;
        } else {
            results.count = 0;
            results.values = null;
        }
        return results;
    }

    @Override // android.widget.Filter
    protected void publishResults(CharSequence constraint, Filter.FilterResults results) {
        Cursor oldCursor = this.mClient.getCursor();
        if (results.values != null && results.values != oldCursor) {
            this.mClient.changeCursor((Cursor) results.values);
        }
    }
}
