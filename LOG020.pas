Unit LOG020;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : LOG020
// FORMULARIO               : FCtrlAcceso
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Formulario de logeo del módulo de adquisiciones
//

// ACTUALIZACIONES:
//HPC_201208_LOG 22/05/2012:  Se modificó la invocación a la función conectate
//                            del servidor debido a que se modificó la cantidad
//                            de argumentos de conexion
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, Mask, wwdbedit, Qt, MConnect, winsock, LOGDM1,
   SConnect;

Type
   TFCtrlAcceso = Class(TForm)
      gbControlAcceso: TGroupBox;
      lblUsuario: TLabel;
      lblContrasena: TLabel;
      dbePassword: TwwDBEdit;
      dbeUsuario: TwwDBEdit;
      bbtnOkIngreso: TBitBtn;
      bbtnCancelaIngreso: TBitBtn;
      Label1: TLabel;
      Label2: TLabel;
      Procedure bbtnOkIngresoClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbePasswordKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure bbtnCancelaIngresoClick(Sender: TObject);
   Private
    { Private declarations }
   Public
      wDCOM1: TSocketConnection;
    { Public declarations }
      xdiasduracpass: Integer;
      cAccesoSistema: String;
      nCont: Integer;
   End;

Var
   FCtrlAcceso: TFCtrlAcceso;
   xSQL: String;

Implementation

{$R *.dfm}

Procedure TFCtrlAcceso.bbtnOkIngresoClick(Sender: TObject);
Var
   xfecfin: TDate;
   xdiasexppass: Integer;
   xdiasfaltantes: Integer;
   xpassact, xctrl_ip, xingresa: String;
Begin
// Usuario se conecta a la base de datos
   inc(nCont);
   cAccesoSistema := 'N';
   Try
      wDCOM1.AppServer.Conectate('xxxxxx', dbeUsuario.Text, dbePassword.Text, cAccesoSistema, '');
      If cAccesoSistema = 'N' Then
      Begin
         Showmessage('Usuario y/o contraseña no reconocido por la Base de Datos');
         If nCont >= 3 Then
         Begin
            ShowMessage('Tres intentos fallidos de conexión, se bloqueara su Usuario. Avice a Sistemas para volver a intentar');
            Application.Terminate;
         End;
         Exit;
      End
      Else
         If cAccesoSistema = 'X' Then
         Begin
            Showmessage('La versión del Servidor de Aplicaciones' + #13 + ' no es la mas reciente');
            Exit;
         End;
   Except
      Showmessage('No pudo conectarse a la Base de Datos');
      If nCont > 3 Then
      Begin
         ShowMessage('Tres intentos fallidos de conexión, se bloqueara su Usuario. Avice a Sistemas para volver a intentar');
         Application.Terminate;
      End;
      Exit;
   End;
   Close;
End;

Procedure TFCtrlAcceso.FormShow(Sender: TObject);
Begin
   dbeUsuario.SetFocus;
End;

Procedure TFCtrlAcceso.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   End;
End;

Procedure TFCtrlAcceso.dbePasswordKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If Key = 13 Then
      bbtnOkIngreso.OnClick(bbtnOkIngreso);
End;

Procedure TFCtrlAcceso.bbtnCancelaIngresoClick(Sender: TObject);
Begin
   Close;
End;

End.

