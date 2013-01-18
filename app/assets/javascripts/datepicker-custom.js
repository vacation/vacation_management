$(function(){
	var startDateTextBox = $('#profile_start_date');
	var endDateTextBox = $('#profile_end_date');
	startDateTextBox.datetimepicker({
	    dataFormat: 'yy-mm-dd',
	    onClose: function(dateText, inst){
	    	if (endDateTextBox.val() != '') {
				var startDate = startDateTextBox.datetimepicker('getDate');
				var endDate = endDateTextBox.datetimepicker('getDate');
				if (startDate > endDate)
					endDateTextBox.datetimepicker('setDate', startDate);
			}
			else {
				endDateTextBox.focus();
			}
			formatDate($(this));
	    },
		onSelect: function (selectedDateTime){
			endDateTextBox.datetimepicker('option', 'minDate', startDateTextBox.datetimepicker('getDate') );
		}
	});
	endDateTextBox.datetimepicker({
	    dataFormat: 'yy-mm-dd',
		onClose: function (selectedDateTime){
			if (startDateTextBox.val() != '') {
				var startDate = startDateTextBox.datetimepicker('getDate');
				var endDate = endDateTextBox.datetimepicker('getDate');
				if (startDate > endDate)
					startDateTextBox.datetimepicker('setDate', endDate);
			}
			formatDate($(this));
		},
		onSelect: function (selectedDateTime){
			startDateTextBox.datetimepicker('option', 'maxDate', endDateTextBox.datetimepicker('getDate') );
			}
	});
	var formatDate = function(inst){
		inst.datepicker( "option", "dateFormat", 'yy-mm-dd' );
	}
});