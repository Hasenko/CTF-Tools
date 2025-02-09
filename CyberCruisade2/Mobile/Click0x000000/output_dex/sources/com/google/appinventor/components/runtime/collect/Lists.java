package com.google.appinventor.components.runtime.collect;

import androidx.appcompat.R$styleable;
import java.util.ArrayList;
import java.util.Collections;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class Lists {
    public static <E> ArrayList<E> newArrayList() {
        return new ArrayList<>();
    }

    public static <E> ArrayList<E> newArrayList(E... elements) {
        int capacity = ((elements.length * R$styleable.AppCompatTheme_ratingBarStyle) / 100) + 5;
        ArrayList<E> list = new ArrayList<>(capacity);
        Collections.addAll(list, elements);
        return list;
    }
}
