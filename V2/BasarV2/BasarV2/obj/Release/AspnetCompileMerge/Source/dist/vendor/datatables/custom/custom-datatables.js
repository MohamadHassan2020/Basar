// Basic DataTable
$(function(){
	$('#basicExample').DataTable({
		'iDisplayLength': 4,
		"language": {
			"lengthMenu": "Display _MENU_ Records Per Page",
			"info": "Showing Page _PAGE_ of _PAGES_",
		}
	});
});



// FPrint/Copy/CSV
$(function(){
	$('#copy-print-csv').DataTable( {
		dom: 'Bfrtip',
		buttons: [
			'copyHtml5',
			'excelHtml5',
			'csvHtml5',
			'pdfHtml5',
			'print'
		],
		"language": {
			"emptyTable": "ليست هناك بيانات متاحة في الجدول",
			"loadingRecords": "جارٍ التحميل...",
			"processing": "جارٍ التحميل...",
			"lengthMenu": "أظهر _MENU_ مدخلات",
			"zeroRecords": "لم يعثر على أية سجلات",
			"info": "إظهار _START_ إلى _END_ من أصل _TOTAL_ مدخل",
			"infoEmpty": "يعرض 0 إلى 0 من أصل 0 سجل",
			"infoFiltered": "(منتقاة من مجموع _MAX_ مُدخل)",
			"search": "ابحث:",
			"paginate": {
				"first": "الأول",
				"previous": "السابق",
				"next": "التالي",
				"last": "الأخير"
			},
			"aria": {
				"sortAscending": ": تفعيل لترتيب العمود تصاعدياً",
				"sortDescending": ": تفعيل لترتيب العمود تنازلياً"
			},
			"select": {
				"rows": {
					"_": "%d قيمة محددة",
					"0": "",
					"1": "1 قيمة محددة"
				}
			},
			"buttons": {
				"print": "طباعة",
				"colvis": "الأعمدة الظاهرة",
				"copy": "نسخ إلى الحافظة",
				"copyTitle": "نسخ",
				"copyKeys": "زر <i>ctrl<\/i> أو <i>⌘<\/i> + <i>C<\/i> من الجدول<br>ليتم نسخها إلى الحافظة<br><br>للإلغاء اضغط على الرسالة أو اضغط على زر الخروج.",
				"copySuccess": {
					"_": "%d قيمة نسخت",
					"1": "1 قيمة نسخت"
				},
				"pageLength": {
					"-1": "اظهار الكل",
					"_": "إظهار %d أسطر"
				}
			}
		} ,
		'iDisplayLength': 5,
	});
});


// Fixed Header
$(document).ready(function(){
	var table = $('#fixedHeader').DataTable({
		fixedHeader: true,
		'iDisplayLength': 4,
		"language": {
			"lengthMenu": "Display _MENU_ Records Per Page",
			"info": "Showing Page _PAGE_ of _PAGES_",
		}
	});
});


// Vertical Scroll
$(function(){
	$('#scrollVertical').DataTable({
		"scrollY": "207px",
		"scrollCollapse": true,
		"paging": false,
		"bInfo" : false,
	});
});



// Row Selection
$(function(){
	$('#rowSelection').DataTable({
		'iDisplayLength': 4,
		"language": {
			"lengthMenu": "Display _MENU_ Records Per Page",
			"info": "Showing Page _PAGE_ of _PAGES_",
		}
	});
	var table = $('#rowSelection').DataTable();

	$('#rowSelection tbody').on( 'click', 'tr', function () {
		$(this).toggleClass('selected');
	});

	$('#button').on('click', function () {
		alert( table.rows('.selected').data().length +' row(s) selected' );
	});
});



// Highlighting rows and columns
$(function(){
	$('#highlightRowColumn').DataTable({
		'iDisplayLength': 4,
		"language": {
			"lengthMenu": "Display _MENU_ Records Per Page",
		}
	});
	var table = $('#highlightRowColumn').DataTable();  
	$('#highlightRowColumn tbody').on('mouseenter', 'td', function (){
		var colIdx = table.cell(this).index().column;
		$(table.cells().nodes()).removeClass('highlight');
		$(table.column(colIdx).nodes()).addClass('highlight');
	});
});



// Using API in callbacks
$(function(){
	$('#apiCallbacks').DataTable({
		'iDisplayLength': 4,
		"language": {
			"lengthMenu": "Display _MENU_ Records Per Page",
		},
		"initComplete": function(){
			var api = this.api();
			api.$('td').on('click', function(){
			api.search(this.innerHTML).draw();
		});
		}
	});
});


// Hiding Search and Show entries
$(function(){
	$('#hideSearchExample').DataTable({
		'iDisplayLength': 4,
		"searching": false,
		"language": {
			"lengthMenu": "Display _MENU_ Records Per Page",
			"info": "Showing Page _PAGE_ of _PAGES_",
		}
	});
});
