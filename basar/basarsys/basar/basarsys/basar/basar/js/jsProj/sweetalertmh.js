//#region   20-4-2020
function msgSuccessProgressBar() {
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-left',
        showConfirmButton: false,
        timer: 3000,
        timerProgressBar: true,
        onOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer);
            toast.addEventListener('mouseleave', Swal.resumeTimer);
        }
    });

    Toast.fire({
        icon: 'success',
        title: 'Signed in successfully'
    });
}

function msgSaveOrCancel(yesFunction) {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-success',
            cancelButton: 'btn btn-danger'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: 'هل تريد الحفظ الان؟',
        text: "لا تستطيع الحذف بعد الحفظ ",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'نعم حفظ!',
        cancelButtonText: 'لا الغاء',
        //reverseButtons: true,
    }).then((result) => {
        if (result.value) {
            //swalWithBootstrapButtons.fire(
            //    'تم الحفظ!',
            //    'تم حفظ البيانات',
            //    'success'
            //);
            
                yesFunction();
           
        } else if (
            /* Read more about handling dismissals below */
            result.dismiss === Swal.DismissReason.cancel
        ) {
            swalWithBootstrapButtons.fire(
                'الغاء',
                'تم التراجع عن الحفظ',
                'error'
            );

        }
    });

}

function msgSuccess(mstTitle, msgText, msgIcon) {
    Swal.fire({
        title: mstTitle,
        text: msgText,
        icon: msgIcon
    });
}
//#endregion