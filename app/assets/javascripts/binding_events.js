$( window ).load( function()
{
    $('#masonry-container').masonry({
        itemSelector: '.pin'
    });

    $('.polaroid-images img').adipoli({
        'startEffect' : 'overlay',
        'hoverEffect' : 'normal'
    });
});

