Unit LOG276;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : LOG275
//Formulario               : fSelectCodArticulo
//Fecha de Creación        : 31/11/2013
//Autor                    : Ricardo Medina Zavaleta
//Objetivo                 : Formulario para selecionar un código de Artículo, cuando la cotizacion tiene artículos matriculados
//                           posterior a su generacion.
//Actualizaciones          :
// HPC_201306_LOG          : Inicio de Formulario
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Wwkeycb, Grids, Wwdbigrd, Wwdbgrid, Buttons;

Type
   TfSelectCodArticulo = Class(TForm)
      GroupBox1: TGroupBox;
      GroupBox2: TGroupBox;
      GroupBox3: TGroupBox;
      edtArtid: TEdit;
      edtArtdes: TEdit;
      dbgArticulos: TwwDBGrid;
      lblBusca: TLabel;
      Ibusca: TwwIncrementalSearch;
      RdArticulo: TRadioButton;
      RdDescripcion: TRadioButton;
      EdtArtidMae: TEdit;
      EdtArtdesMae: TEdit;
      btnAcepta: TBitBtn;
      Procedure FormShow(Sender: TObject);
      Procedure RdDescripcionClick(Sender: TObject);
      Procedure RdArticuloClick(Sender: TObject);
      Procedure dbgArticulosDblClick(Sender: TObject);
      Procedure btnAceptaClick(Sender: TObject);
   Private
    { Private declarations }

   Public
    { Public declarations }
      vAcepta: String;
   End;

Var
   fSelectCodArticulo: TfSelectCodArticulo;

Implementation
Uses LOGDM1;
{$R *.dfm}

Procedure TfSelectCodArticulo.FormShow(Sender: TObject);
Begin
   dbgArticulos.Selected.Clear;
   dbgArticulos.Selected.Add('ARTID'#9'15'#9'Articulo'#9'F');
   dbgArticulos.Selected.Add('ARTDES'#9'60'#9'Decripción'#9'F');
   dbgArticulos.DataSource := DMLOG.dsArti;
   RdDescripcion.Checked := True;
   RdDescripcionClick(Self);
End;

Procedure TfSelectCodArticulo.RdDescripcionClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   lblBusca.Caption := 'Descripción';
   Ibusca.Left := 95;
   Ibusca.Top := 11;
   Ibusca.Width := 404;
   IBusca.Text := '';
   DMLOG.cdsArti.IndexFieldNames := 'ARTDES';
   IBusca.SearchField := 'ARTDES';
   Ibusca.DataSource := DMLOG.dsArti;
   Ibusca.SetFocus;
   Screen.Cursor := crDefault;
End;

Procedure TfSelectCodArticulo.RdArticuloClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   lblBusca.Caption := 'Código:';
   Ibusca.Left := 67;
   Ibusca.Top := 11;
   Ibusca.Width := 107;
   IBusca.Text := '';
   DMLOG.cdsArti.IndexFieldNames := 'ARTID';
   IBusca.SearchField := 'ARTID';
   Ibusca.DataSource := DMLOG.dsArti;
   Ibusca.SetFocus;
   Screen.Cursor := crDefault;
End;

Procedure TfSelectCodArticulo.dbgArticulosDblClick(Sender: TObject);
Begin
   EdtArtidMae.Text := DMLOG.cdsArti.FieldByname('Artid').AsString;
   EdtArtdesMae.Text := DMLOG.cdsArti.FieldByname('Artdes').AsString;
End;

Procedure TfSelectCodArticulo.btnAceptaClick(Sender: TObject);
Begin
   If MessageDlg('Esta seguro(a) de selecionar el código?', mtconfirmation, [mbYes, mbNo], 0) = mrYes Then
      vAcepta := 'S'
   Else
      vAcepta := 'N';
   CLose;
End;

End.

