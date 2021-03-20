{
  const  app = {
        ddlStatsSummaryCampsNew: document.getElementById('ddlStatsSummaryCampsNew'),
        txtFirstFollowUpDate: document.getElementById('txtFirstFollowUpDate'),
        txtSecondFollowUpDate: document.getElementById('txtSecondFollowUpDate'),
          btnSave: document.getElementById('btnSave'),
          btnReset: document.getElementById('btnReset'),
        spanTotalOpd: document.getElementById('spanTotalOpd'),
        spanOrWhiteWater: document.getElementById('spanOrWhiteWater'),
        spanGlasses: document.getElementById('spanGlasses'),
        spanPhaco: document.getElementById('spanPhaco'),
        spanOrTotal: document.getElementById('spanOrTotal'),
        tbodyAxis: document.getElementById('tbodyAxis'),
        init: () => { document.addEventListener('DOMContentLoaded', app.load); },
        preLoad: () => { },
        load: () => {

            app.pageFunction();

        },
        pageFunction: () => {


            if (app.btnSave) {
                app.btnSave.addEventListener('click', () => {
                    msgSaveOrCancel(() => {
                        msgSuccess('تم الحفظ','تم حفظ الاحصائية بنجاح','success');
                    });
                });
            }
            if (app.btnReset) {
                app.btnReset.addEventListener('click', () => {
                    window.location.reload();
                 });
            }
            //#region datetime picker
            $(document).on('blur', `#tableAxis tbody tr .txtmale`, function () {
                app.getSum();

            });
            $(document).on('blur', `#tableAxis tbody tr .txtfemale`, function () {
                app.getSum();

            });


            getCalenderPicker($(txtFirstFollowUpDate), $(txtSecondFollowUpDate));

            getPlansFollowUp($(ddlStatsSummaryCampsNew), 2);

            app.getAxis();


        },
        getAxis: () => {

            let obj = {};

            getDataFromFunction(obj, '/basar/axis', (data) => {
                app.initItem(data);

            })

        },
        initItem: (data) => {
            let itemRow = '',
                len = $('#tbodyAxis tr').length;
            $.each(data, (index, item) => {
                itemRow += `<tr>`;
                itemRow += `<td>${index + 1}</td>`;
                itemRow += `<td class='axisdescar'><p>${item.AxisDescAR}</p><p>${item.AxisDescEN}</p></td>`;
                itemRow += `<td><input id="txt${index}" type="text" class="form-control txtmale" /></td>`;
                itemRow += `<td><input id="txtc${index}" type="text" class="form-control txtfemale" /></td>`;
                itemRow += `<td class="txtsum ${item.AxisClassName == 'null' ? '' : item.AxisClassName}"></td>`;
                itemRow += `</tr>`;
            });

            $(tbodyAxis).append(itemRow);
        },
        getSum: (data) => {
            let sumOrWhiteWater = 0,
                orTotal = 0,
                glassCount = 0,
                phachoSum = 0,
                opdSum = 0;
            $('#tableAxis tbody tr').each(function () {
                let txtmale = $.trim($(this).find(".txtmale").val()),
                    txtfemale = $.trim($(this).find(".txtfemale").val()),
                    txtsum = $(this).find(".txtsum"),
                    opd = $(this).find(".opd"),
                    orWhiteWater = $(this).find(".or-white-water"),
                    phaco = $(this).find(".phaco"),
                    txtOrTotal = $(this).find(".or-total"),
                    glasses = $(this).find(".glasses"),
                    maleValue = isNaN(parseFloat(txtmale)) ? 0 : parseFloat(txtmale),
                    femalValue = isNaN(parseFloat(txtfemale)) ? 0 : parseFloat(txtfemale);
                phacoValue = isNaN(parseFloat(phaco.text())) ? 0 : parseFloat(phaco.text());
                opdValue = isNaN(parseFloat(opd.text())) ? 0 : parseFloat(opd.text());
                orWhiteWaterValue = isNaN(parseFloat(orWhiteWater.text())) ? 0 : parseFloat(orWhiteWater.text());
                glassesValue = isNaN(parseFloat(glasses.text())) ? 0 : parseFloat(glasses.text());
                txtOrTotalValue = isNaN(parseFloat(txtOrTotal.text())) ? 0 : parseFloat(txtOrTotal.text());
                $(txtsum).text(parseFloat(maleValue) + parseFloat(femalValue));
                opdSum += opdValue;
                orTotal += txtOrTotalValue;
                glassCount += glassesValue;
                phachoSum += phacoValue;
                sumOrWhiteWater += orWhiteWaterValue;
                // $(spanTotalOpd).text('testx');

            });
            app.spanPhaco.textContent = phachoSum;
            $(spanTotalOpd).text(opdSum);
            $(spanOrWhiteWater).text(sumOrWhiteWater);
            $(spanOrTotal).text(orTotal);
            $(spanGlasses).text(glassCount);
        },


    }
    app.init();
}