using System;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
    protected void editor_Init(object sender, EventArgs e) {
        SetValidationGroup(sender);
    }

    private static void SetValidationGroup(object sender) {
        ASPxEdit editor = (ASPxEdit)sender;
        GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)editor.NamingContainer;
        editor.ValidationSettings.ValidationGroup = String.Format("Group{0}", container.VisibleIndex);
    }
}