package com.google.appinventor.components.runtime;

import com.google.appinventor.components.annotations.DesignerComponent;
import com.google.appinventor.components.annotations.DesignerProperty;
import com.google.appinventor.components.annotations.PropertyCategory;
import com.google.appinventor.components.annotations.SimpleEvent;
import com.google.appinventor.components.annotations.SimpleFunction;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.SimpleProperty;
import com.google.appinventor.components.annotations.UsesPermissions;
import com.google.appinventor.components.common.ComponentCategory;
import kawa.lang.SyntaxForms;

@UsesPermissions(permissionNames = "android.permission.INTERNET")
@DesignerComponent(category = ComponentCategory.INTERNAL, description = "Use this component to translate words and sentences between different languages. This component needs Internet access, as it will request translations to the Yandex.Translate service. Specify the source and target language in the form source-target using two letter language codes. So\"en-es\" will translate from English to Spanish while \"es-ru\" will translate from Spanish to Russian. If you leave out the source language, the service will attempt to detect the source language. So providing just \"es\" will attempt to detect the source language and translate it to Spanish.<p /> This component is powered by the Yandex translation service.  See http://api.yandex.com/translate/ for more information, including the list of available languages and the meanings of the language codes and status codes. <p />Note: Translation happens asynchronously in the background. When the translation is complete, the \"GotTranslation\" event is triggered.", iconName = "images/yandex.png", nonVisible = SyntaxForms.DEBUGGING, version = 3)
@SimpleObject
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public final class YandexTranslate extends AndroidNonvisibleComponent {
    public YandexTranslate(ComponentContainer container) {
        super(container.$form());
    }

    @SimpleFunction(description = "By providing a target language to translate to (for instance, 'es' for Spanish, 'en' for English, or 'ru' for Russian), and a word or sentence to translate, this method will request a translation to the Yandex.Translate service.\nOnce the text is translated by the external service, the event GotTranslation will be executed.\nNote: Yandex.Translate will attempt to detect the source language. You can also specify prepending it to the language translation. I.e., es-ru will specify Spanish to Russian translation.")
    public void RequestTranslation(String languageToTranslateTo, String textToTranslate) {
    }

    @SimpleEvent(description = "Event triggered when the Yandex.Translate service returns the translated text. This event also provides a response code for error handling. If the responseCode is not 200, then something went wrong with the call, and the translation will not be available.")
    public void GotTranslation(String responseCode, String translation) {
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "Set the API Key to use with Yandex. You do not need to set this if you are using the MIT system because MIT has its own key builtin. If set, the key provided here will be used instead")
    @DesignerProperty(defaultValue = "DEFAULT", editorType = "string")
    public void ApiKey(String apiKey) {
    }
}
