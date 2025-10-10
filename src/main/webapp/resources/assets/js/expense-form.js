document.addEventListener("DOMContentLoaded", function () {
    // BANK handling
    const accountSelect = document.getElementById("account");
    const newBankDiv = document.getElementById("newBankDiv");
    const newBankInput = document.getElementById("newAccount");

    accountSelect.addEventListener("change", function () {
        if (this.value === "__new__") {
            newBankDiv.style.display = "block";
            newBankInput.required = true;
        } else {
            newBankDiv.style.display = "none";
            newBankInput.value = "";
            newBankInput.required = false;
        }
    });

    // CATEGORY handling
    const categorySelect = document.getElementById("category");
    const newCategoryDiv = document.getElementById("newCategoryDiv");
    const newCategoryInput = document.getElementById("newCategory");

    categorySelect.addEventListener("change", function () {
        if (this.value === "__new__") {
            newCategoryDiv.style.display = "block";
            newCategoryInput.required = true;
        } else {
            newCategoryDiv.style.display = "none";
            newCategoryInput.value = "";
            newCategoryInput.required = false;
        }
    });
});

// FORM validation
function validateIncomeForm() {
    let isValid = true;

    // BANK validation
    const account = document.getElementById("account").value;
    if (account === "Choose Bank..." || account === "") {
        document.getElementById("accountError").classList.remove("d-none");
        isValid = false;
    } else {
        document.getElementById("accountError").classList.add("d-none");
    }

    // New bank input validation
    if (account === "__new__") {
        const newBankVal = document.getElementById("newAccount").value.trim();
        if (newBankVal === "") {
            document.getElementById("newBankError").classList.remove("d-none");
            isValid = false;
        } else {
            document.getElementById("newBankError").classList.add("d-none");
        }
    }

    // CATEGORY validation
    const category = document.getElementById("category").value;
    if (category === "Choose Category..." || category === "") {
        document.getElementById("categoryError").classList.remove("d-none");
        isValid = false;
    } else {
        document.getElementById("categoryError").classList.add("d-none");
    }

    // New category input validation
    if (category === "__new__") {
        const newCatVal = document.getElementById("newCategory").value.trim();
        if (newCatVal === "") {
            document.getElementById("newCategoryError").classList.remove("d-none");
            isValid = false;
        } else {
            document.getElementById("newCategoryError").classList.add("d-none");
        }
    }

    // Alert messages
    if (!isValid) {
        showAlert("Please fix the errors before submitting!", "danger");
    } else {
        showAlert("Income added successfully!", "success");
    }

    return isValid;
}

// Optional: simple alert function
function showAlert(message, type) {
    const alertBox = document.getElementById("alertBox");
    alertBox.style.display = "block";
    alertBox.className = "alert alert-" + type; // success / danger
    alertBox.innerText = message;

    setTimeout(() => {
        alertBox.style.display = "none";
    }, 3000);
}
