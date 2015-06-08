function destroyUnfinished() {
    $.ajax({
      type: "POST",
      url: "delete_unfinished"
    })
}