
/**
 * Generic style changes for YouTube.
 *
 * I'm not social, so I don't need pretty much of the YouTube interface right
 * now, all comments, the sidebar, and obviously the ads are useless and are
 * costing some rendering time on my browser.
 *
 * @return void
 */

jQuery(function($){
    setTimeout(function(){
        $('body').css({ 'background': '#222' });
        $('#yt-masthead-container').css({ 'background': '#000', 'border-bottom': '1px solid #444' });
        $('#watch7-content, .not-watch8 #watch7-headline, #watch7-user-header, .not-watch8 #watch7-sidebar').css({ 'background': '#111' });
        $('body #footer-container').css({ 'background-color': '#00', 'border-top': '1px solid #444' });
        $('#footer-main').css({ 'border-bottom': '1px solid #444' });
        $('#watch-discussion').remove();
    }, 1000);
});
