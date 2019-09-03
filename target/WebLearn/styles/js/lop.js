e.preventDefault();
var form =$(this).parents('form');
swal.fire({
    title:'Are you sure?',
    text:'You will not be able to recover this operation!',
    type:'warning',
    showCancelButton:true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Yes, delete it!',
    cancelButtonText: 'No, cancel please!',
    closeOnConfirm: false,

},function (isConfirm) {
    if(isConfirm){
        form.submit();
    }else{
        swal.fire('Cancelled',
            'Your  product is safe :)',
            'error');
    }

});