$(function() {
  $('.toggleDeadlineUnitDate').on('click', function(e) {
    e.preventDefault();
    $(this).replaceWith("<label for='project_goal_deadline_date'>Goal Deadline Date</label><input type='date' name='project[goal_deadline_date]' id='project_goal_deadline_date'></input>");
    $('.toggleDeadlineUnitHours').remove();
  });

  $('.toggleDeadlineUnitHours').on('click', function(e) {
    e.preventDefault();
    $(this).replaceWith("<label for='project_goal_time_limit'>Goal Time Limit</label> <input type='text' name='project[goal_time_limit]' id='project_goal_time_limit'></input> <label>hours</label>");
    $('.toggleDeadlineUnitDate').remove();
  });

});