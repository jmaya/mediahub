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

})()
