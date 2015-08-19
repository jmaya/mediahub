(function() {
  var tags= new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch: {
        url: '/api/v1/tags',
      filter: function(list) {
        return $.map(list, function(tag) { return { name: tag.name}; });
      }
      }

  });
  tags.initialize();

  $('#course_tag_list').typeahead(null, {
    name: 'tags',
    displayKey: 'name',
    valueKey: 'name',
    source: tags.ttAdapter()
  });

  // var video = $('video');
  videojs('example_video_1', {
    plugins: {
      speed: [
        { text: '1배속', rate: 1, selected: true },
        { text: '2배속', rate: 2 },
        { text: '4배속', rate: 4 },
        { text: '8배속', rate: 8 }
      ]
    }
  });


})()
