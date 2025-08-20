document.addEventListener("DOMContentLoaded", function () {
	// CATEGORY handling
	const categorySelect = document.getElementById("category");
	const newCategoryDiv = document.getElementById("newCategoryDiv");
	const newCategoryInput = document.getElementById("newCategory");

	if (categorySelect && newCategoryDiv && newCategoryInput) {
		categorySelect.addEventListener("change", function () {
			const show = this.value === "__new__";
			newCategoryDiv.style.display = show ? "block" : "none";
			newCategoryInput.required = show;
		});
	}

	// BANK handling
	const accountSelect = document.getElementById("account");

	if (accountSelect) {
		accountSelect.addEventListener("change", function () {
			let existingBankDiv = document.getElementById("newBankDiv");

			if (this.value === "__new__") {
				if (!existingBankDiv) {
					existingBankDiv = document.createElement("div");
					existingBankDiv.className = "col-md-6";
					existingBankDiv.id = "newBankDiv";
					existingBankDiv.innerHTML = `
						<label for="newAccount" class="form-label">New Bank</label>
						<input type="text" class="form-control" id="newAccount" name="newAccount" placeholder="Enter new bank name" required>
					`;

					// Insert after bank dropdown
					accountSelect.closest(".col-md-12").after(existingBankDiv);
				}
			} else {
				if (existingBankDiv) {
					existingBankDiv.remove();
				}
			}
		});
	}
});
