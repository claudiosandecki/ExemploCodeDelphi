unit Classes.AnsataCustaCasamento;

interface

// Estabelece um "contrato" para que as classes de custas tenham os mesmos métodos.
type
  ICustaCasamento = Interface
    function getResult : double;
    procedure setResult( value: double );
    procedure custaCasamento(ano: integer);
    procedure custaCasamentoReligioso(ano: integer);
    procedure custaCasamentoForaSede(ano: integer);

    property result: double read getResult write setResult;
end;


// Classe de métodos para as custas de GO.
TAnsataCustaCasamentoGO = class (TInterfacedObject, ICustaCasamento)
private
  fResult: double;
protected
    function getResult : double;
    procedure setResult ( value : double );
    procedure custaCasamento(ano: integer);
    procedure custaCasamentoReligioso(ano: integer);
    procedure custaCasamentoForaSede(ano: integer);
end;

// Classe de métodos para as custas de GO.
TAnsataCustaCasamentoPR = class (TInterfacedObject, ICustaCasamento)
private
  fResult: double;
protected
    function getResult : double;
    procedure setResult ( value : double );
    procedure custaCasamento(ano: integer);
	procedure custaCasamentoReligioso(ano: integer);
    procedure custaCasamentoForaSede(ano: integer);
end;

implementation


{AnsataCustasGO}

//Implementa os métodos para as regras de custas de GO.
function TAnsataCustaCasamentoGO.getResult: double;
begin
   result := Self.fResult;
end;

procedure TAnsataCustaCasamentoGO.setResult(value: double);
begin
   self.fResult := value;
end;

procedure TAnsataCustaCasamentoGO.custaCasamento(ano: integer);
begin
  if ano = 2021 then setResult(self.fResult + 420);
  if ano = 2022 then setResult(self.fResult + 180);
end;

procedure TAnsataCustaCasamentoGO.custaCasamentoReligioso(ano: integer);
begin
  if ano = 2021 then setResult(self.fResult + 220);
  if ano = 2022 then setResult(self.fResult + 250);
end;

procedure TAnsataCustaCasamentoGO.custaCasamentoForaSede(ano: integer);
begin
  if ano = 2021 then setResult(self.fResult + 300);
  if ano = 2022 then setResult(self.fResult + 400);
end;


{AnsataCustasPR}

//Implementa os métodos para as regras de custas de GO.
function TAnsataCustaCasamentoPR.getResult: double;
begin
   result := Self.fResult;
end;
procedure TAnsataCustaCasamentoPR.setResult(value: double);
begin
   self.fResult := value;
end;

procedure TAnsataCustaCasamentoPR.custaCasamento(ano: integer);
begin
  if ano = 2021 then setResult(self.fResult + 380);
  if ano = 2022 then setResult(self.fResult + 430);
end;

procedure TAnsataCustaCasamentoPR.custaCasamentoReligioso(ano: integer);
begin
  if ano = 2021 then setResult(self.fResult + 120);
  if ano = 2022 then setResult(self.fResult + 150);
end;

procedure TAnsataCustaCasamentoPR.custaCasamentoForaSede(ano: integer);
begin
  if ano = 2021 then setResult(self.fResult + 200);
  if ano = 2022 then setResult(self.fResult + 230);
end;

end.

//==============================================================================================

// Exemplo de um código em um form acessando as classes de custas.
procedure TFormOrcamentoCasamento.btnCalcularCustaClick(Sender: TObject);
var
  custaCasamento: ICustaCasamento;
begin
  try
    // definir qual classe de custa deve carregar.
    if comboCasamento.text = 'PR' then
      custaCasamento :=  TAnsataCustaCasamentoPR.Create;
    if comboCasamento.text = 'GO' then
      custaCasamento :=  TAnsataCustaCasamentoGO.Create;

    // Adiciona os valores conforme os parâmetros.
    custaCasamento.custaCasamento(intToStr(editAnoCasamento.Text));

    if checkboxCasamentoReligio.Checked then
      custaCasamento.custaCasamentoReligioso(intToStr(editAnoCasamento.Text));

    if checkboxCasamentoForaSede.Checked then
      custaCasamento.custaCasamentoForaSede(editAnoCasamento.Text));

    showMessage(floatToStr(custaCasamento.result));
   except
     raise
  end;
end;
