clientSideValidations.validators.local["email_format"] = function (email, options) {
  if(!/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i.test(element.val())) {
      return options.message;
    }
}
