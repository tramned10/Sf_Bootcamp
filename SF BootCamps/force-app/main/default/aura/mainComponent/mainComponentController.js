({
	handleShowModal: function(component, evt, helper) {
		var modalBody;
		debugger;
		$A.createComponent("c:modalContent", {},
			function(content, status) {
			if (status === "SUCCESS") {
				modalBody = content;
				component.find('overlayLib').showCustomModal({
							header: "Application Confirmation",
							body: modalBody,
							showCloseButton: true,
							cssClass: "mymodal",
							closeCallback: function() {
							alert('You closed the alert');
												}
										})
									}
								});
							}
})