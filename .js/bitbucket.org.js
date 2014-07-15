
/**
 * Remove the annoying dialogs from the new BitBucket interface.
 *
 * These dialogs were introduced when the responsive interface of the new
 * BitBucket design was released, intending to explain the new buttons and
 * layouts, but more than two months has passed since the injection of these
 * things and I'm already annoyed by them. Sure I can click "Got it" and hide
 * them "forever", but that's not sure, they will probably use a the "Local
 * Storage" API or a cookie to decide if the dialogs are necessary.
 *
 * @return void
 */

jQuery(document).ready(function($){
    setTimeout(function(){
        var selector = '#inline-dialog-sidebar-feature';

        if( $(selector).length ){
            $(selector).remove();
            console.log('.js: removing feature dialogs');
        } else {
            console.log('.js: no feature dialogs were found');
        }
    }, 1500);
});
