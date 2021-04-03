class SharedSweetAlert {

    constructor(title = 'مؤسسة البصر الخيرية', text = '') {
        this.title = title;
        this.text = text
    }

    //#region my msg
    //confirm msg
    confirmMsg(title, text, icon, funConfirm, funCancel, confirmButtonText = 'نعم', cancelButtonText = 'لا', confirmButtonClass = 'btn btn-success', cancelButtonClass = 'btn btn-danger ml-1') {
        Swal.fire({
            title,
            text,
            icon,
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText, //`<i class="bx bx-like"></i> ${confirmButtonText}`,
            cancelButtonText,
            confirmButtonClass,
            cancelButtonClass,
            buttonsStyling: false,
        }).then(function (result) {
            if (result.value) {
                funConfirm();
            }
            else if (result.dismiss === Swal.DismissReason.cancel) {
                funCancel()
            }
        })

    }

    //success error warning
    typeMsg(title = 'مؤسسة البصر الخيرية', text = '', icon = 'success') {
        Swal.fire({
            title,
            text,
            icon,
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        });
    }

    autoCloseMsg(title = 'مؤسسة البصر الخيرية', text = '',icon='warning') {
        let timerInterval
        Swal.fire({
            title,
            text,
            icon,
            html: 'اغلاق خلال <strong></strong> ثانية.',
            timer: 2000,
            //confirmButtonClass: 'btn btn-primary',
            showConfirmButton: false,
            buttonsStyling: false,
            onBeforeOpen: function () {
                Swal.showLoading()
                timerInterval = setInterval(function () {
                    Swal.getContent().querySelector('strong')
                        .textContent = Swal.getTimerLeft()
                }, 100)
            },
            onClose: function () {
                clearInterval(timerInterval)
            }
        }).then(function (result) {
            if (
                // Read more about handling dismissals
                result.dismiss === Swal.DismissReason.timer
            ) {
                console.log('I was closed by the timer')
            }
        })
    }

    //#endregion my msg

    //#region librrary code

    //basic
    getBasic() {
        Swal.fire({
            title: 'Any fool can use a computer',
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        });
    }

    withTitle() {
        Swal.fire({
            title: 'The Internet?,',
            text: "That thing is still around?",
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        })
    }

    footerAlert() {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Something went wrong!',
            footer: '<a href>Why do I have this issue?</a>',
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        })
    }

    htmlAlert() {
        Swal.fire({
            title: '<strong>HTML <u>example</u></strong>',
            icon: 'info',
            html:
                'You can use <b>bold text</b>, ' +
                '<a href="https://pixinvent.com/" target="_blank">links</a> ' +
                'and other HTML tags',
            showCloseButton: true,
            showCancelButton: true,
            focusConfirm: false,
            confirmButtonText:
                '<i class="bx bx-like"></i> Great!',
            confirmButtonAriaLabel: 'Thumbs up, great!',
            cancelButtonText:
                '<i class="bx bx-dislike"></i>',
            cancelButtonAriaLabel: 'Thumbs down',
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
            cancelButtonClass: 'btn btn-danger ml-1',
        })

    }

    positionTopStart() {
        Swal.fire({
            position: 'top-start',
            icon: 'success',
            title: 'Your work has been saved',
            showConfirmButton: false,
            timer: 1500,
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        })
    }

    positionTopEnd() {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Your work has been saved',
            showConfirmButton: false,
            timer: 1500,
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        })
    }

    positionBottomStart() {
        Swal.fire({
            position: 'bottom-start',
            icon: 'success',
            title: 'Your work has been saved',
            showConfirmButton: false,
            timer: 1500,
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        })
    }

    positionBottomEnd() {
        Swal.fire({
            position: 'bottom-end',
            icon: 'success',
            title: 'Your work has been saved',
            showConfirmButton: false,
            timer: 1500,
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        })
    }

    //animation
    bounceInAnimation() {
        Swal.fire({
            title: 'Bounce In Animation',

            showClass: {
                popup: 'animate__animated animate__bounceIn'
            },
            hideClass: {
                popup: 'animate__animated animate__bounceOut'
            },
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        })

    }

    //fade in animation
    fadeInAnimation() {
        Swal.fire({
            title: 'Fade In Animation',

            showClass: {
                popup: 'animate__animated animate__fadeIn'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOut'
            },
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        })
    }

    //flip x animation
    flipXAnimation() {
        Swal.fire({
            title: 'لا اله الا الله',

            showClass: {
                popup: 'animate__animated animate__flipInX'
            },
            hideClass: {
                popup: 'animate__animated animate__flipOutX'
            },
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        })
    }

    //tada animation
    tadaAnimation() {
        Swal.fire({
            title: 'بسم الله',

            showClass: {
                popup: 'animate__animated animate__tada'
            },
            hideClass: {
                popup: 'animate__animated animate__zoomOut'
            },
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        })
    }

    //SHAKE ANIMATION
    shakeAnimation() {
        Swal.fire({
            title: 'Shake Animation',

            showClass: {
                popup: 'animate__animated animate__shakeX'
            },
            hideClass: {
                popup: 'animate__animated animate__zoomOut'
            },
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        })
    }

    //success
    typeSuccess() {
        Swal.fire({
            title: "Good job!",
            text: "You clicked the button!",
            icon: "success",
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        });
    }

    typeInfo() {
        Swal.fire({
            title: "Info!",
            text: "You clicked the button!",
            icon: "info",
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        });
    }

    //warning
    typeWarning() {
        Swal.fire({
            title: "Warning!",
            text: " You clicked the button!",
            icon: "warning",
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        });
    }

    //error
    typeError() {
        Swal.fire({
            title: "Error!",
            text: " You clicked the button!",
            icon: "error",
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        });
    }

    //custom icon
    customIcon() {
        Swal.fire({
            title: 'Sweet!',
            text: 'Modal with a custom image.',
            imageUrl: '../app-assets/images/slider/04.jpg',
            imageWidth: 400,
            imageHeight: 200,
            imageAlt: 'Custom image',
            animation: false,
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        })

    }

    //auto close
    autoClose() {
        let timerInterval
        Swal.fire({
            title: 'Auto close alert!',
            html: 'I will close in <strong></strong> seconds.',
            timer: 2000,
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
            onBeforeOpen: function () {
                Swal.showLoading()
                timerInterval = setInterval(function () {
                    Swal.getContent().querySelector('strong')
                        .textContent = Swal.getTimerLeft()
                }, 100)
            },
            onClose: function () {
                clearInterval(timerInterval)
            }
        }).then(function (result) {
            if (
                // Read more about handling dismissals
                result.dismiss === Swal.DismissReason.timer
            ) {
                console.log('I was closed by the timer')
            }
        })
    }

    //out side click
    outSideClick() {
        Swal.fire({
            title: 'Click outside to close!',
            text: 'This is a cool message!',
            allowOutsideClick: true,
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
        });
    }

    //prompt function
    promptFunction() {
        Swal.mixin({
            input: 'text',
            confirmButtonText: 'Next &rarr;',
            showCancelButton: true,
            progressSteps: ['1', '2', '3'],
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
            cancelButtonClass: "btn btn-danger ml-1"
        }).queue([
            {
                title: 'Question 1',
                text: 'Chaining swal2 modals is easy'
            },
            'Question 2',
            'Question 3'
        ]).then(function (result) {
            if (result.value) {
                Swal.fire({
                    title: 'All done!',
                    html:
                        'Your answers: <pre><code>' +
                        JSON.stringify(result.value) +
                        '</code></pre>',
                    confirmButtonText: 'Lovely!'
                })
            }
        })

    }

    //ajax request
    ajaxRequest() {
        Swal.fire({
            title: 'Search for a user',
            input: 'text',
            confirmButtonClass: 'btn btn-primary',
            buttonsStyling: false,
            inputAttributes: {
                autocapitalize: 'off'
            },
            showCancelButton: true,
            confirmButtonText: 'Look up',
            showLoaderOnConfirm: true,
            cancelButtonClass: "btn btn-danger ml-1",
            preConfirm: function (login) {
                return fetch("//api.github.com/users/" + login + "")
                    .then(function (response) {
                        if (!response.ok) {
                            console.log(response)
                            throw new Error(response.statusText)
                        }
                        return response.json()
                    })
                    .catch(function (error) {
                        Swal.showValidationMessage(
                            "Request failed:  " + error + ""
                        )
                    })
            },
            allowOutsideClick: function () {
                !Swal.isLoading()
            }
        }).then(function (result) {
            if (result.value) {
                Swal.fire({
                    title: "" + result.value.login + "'s avatar",
                    imageUrl: result.value.avatar_url
                })
            }
        })

    }


    //confirm text

    confirmText() {
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Your text here!',
            'confirmButtonClass': 'btn btn-primary',
            'cancelButtonClass': 'btn btn-danger ml-1',
            buttonsStyling: false,
        }).then(function (result) {
            if (result.value) {
                Swal.fire(
                    {
                        icon: "success",
                        title: 'Deleted!',
                        text: 'Your file has been deleted.',
                        confirmButtonClass: 'btn btn-success',
                    }
                )
            }
        })

    }

    //confirm color

    confirmColor() {
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!',
            'confirmButtonClass': 'btn btn-warning',
            'cancelButtonClass': 'btn btn-danger ml-1',
            buttonsStyling: false,
        }).then(function (result) {
            if (result.value) {
                Swal.fire({
                    icon: "success",
                    title: 'Deleted!',
                    text: 'Your file has been deleted.',
                    confirmButtonClass: 'btn btn-success',
                })
            }
            else if (result.dismiss === Swal.DismissReason.cancel) {
                Swal.fire({
                    title: 'Cancelled',
                    text: 'Your imaginary file is safe :)',
                    icon: 'error',
                    confirmButtonClass: 'btn btn-success',
                })
            }
        })

    }

    //#endregion librrary code
}