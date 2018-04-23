Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub editor_Init(ByVal sender As Object, ByVal e As EventArgs)
		SetValidationGroup(sender)
	End Sub

	Private Shared Sub SetValidationGroup(ByVal sender As Object)
		Dim editor As ASPxEdit = CType(sender, ASPxEdit)
		Dim container As GridViewDataItemTemplateContainer = CType(editor.NamingContainer, GridViewDataItemTemplateContainer)
		editor.ValidationSettings.ValidationGroup = String.Format("Group{0}", container.VisibleIndex)
	End Sub
End Class