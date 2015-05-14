

if(typeof(CKEDITOR) != 'undefined')
{
    CKEDITOR.editorConfig = function(config) {
        config.uiColor = "#AADC6E";
        config.disableNativeSpellChecker = true;
        config.toolbar = [ [ 'SpellChecker', 'Scayt' ], ['CreatePlaceholder'], ['Bold', 'Italic', 'Underline', 'Strike', '-', 'RemoveFormat'], ['NumberedList', 'BulletedList'], ['Format'] ];
    }
} else{
    console.log("ckeditor not loaded")
}

