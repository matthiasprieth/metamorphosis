$( window ).load( function()
{
    $('#masonry-container').masonry({
        itemSelector: '.pin'
    });

    $('.polaroid-images').adipoli({
        'startEffect' : 'normal',
        'hoverEffect' : 'popout'
    });
});

