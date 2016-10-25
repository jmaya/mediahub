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

  // videojs('video', {
  //   // plugins: {
  //   //   speed: [
  //   //     { text: '1', rate: 1},
  //   //     { text: '2', rate: 2, selected: true },
  //   //     { text: '4', rate: 4 },
  //   //     { text: '8', rate: 8 }
  //   //   ]
  //   // },
  //  "controls": true,
  //  "preload":"none",
  //  "autoplay":false,
  //  "playbackRates": [0.5, 1, 1.5, 2]
  // });
})()
