
$(function()  {
    let linkItems = document.querySelectorAll(".link-item");

    linkItems.forEach((linkItem) => {
        linkItem.addEventListener("click", linkItemClick);
    });
    
    $("input").blur(function(e) {
        check($(e.target));
    });
});

function query(ctx) {
    if (check($("input"))) {
        let qq = $("#record_qq").val();
        $(window).attr('location', ctx + '/record/query/show/' + qq);
    }
}

function check(input) {
    let isCheck = true;
    input.each(function(i, e) {
        if ($(e).val()) {
            $(e).removeClass("invalid");
            isCheck = true;
        } else {
            $(e).addClass("invalid");
            isCheck = false;
        }
    });
    return isCheck;
}

function linkItemClick() {
    let activeContentPanel = document.querySelector(".panel.active");
    activeContentPanel.classList.remove("active");

    let activeLinkItem= document.querySelector(".link-item.active");
    activeLinkItem.classList.remove("active");

    let panelId = this.dataset.panelId;
    let contentPanel = document.querySelector("#" + panelId);

    this.classList.add("active");
    contentPanel.classList.add("active");
}