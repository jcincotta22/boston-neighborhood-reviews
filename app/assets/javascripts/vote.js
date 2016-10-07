
$(document).ready(function() {
  $(".like").submit(function(event) {
    event.preventDefault();
    let string= $(this).find('input[name="review[vote_count]"]').val();
    let microhood_id= $(this).find('input[name="review[microhood_id]"]').val();
    let id= $(this).find('input[name="review[id]"]').val();
    $.ajax({
      type: "GET",
      url: `/api/microhoods/${microhood_id}/reviews/${id}`,
      contentType: 'application/json',
      data: {value: "up"}
    }).done(data=>{
      $(`.up-button-${data.id}`).addClass(`${data.class}`);
      $(`.down-button-${data.id}`).removeClass('red');
      $(`.vote_count-${data.id}`)[0].innerText = `Vote count: ${data.vote_count}`;
    });
  });

  $(".dislike").submit(function(event) {
    event.preventDefault();
    let string= $(this).find('input[name="review[vote_count]"]').val();
    let microhood_id= $(this).find('input[name="review[microhood_id]"]').val();
    let id= $(this).find('input[name="review[id]"]').val();
    $.ajax({
      type: "GET",
      url: `/api/microhoods/${microhood_id}/reviews/${id}`,
      contentType: 'application/json',
      data: {value: "down"}
    }).done(data=>{
      $(`.down-button-${data.id}`).addClass(`${data.class}`);
      $(`.up-button-${data.id}`).removeClass('green');
      $(`.vote_count-${data.id}`)[0].innerText = `Vote count: ${data.vote_count}`;
    });
  });
});
