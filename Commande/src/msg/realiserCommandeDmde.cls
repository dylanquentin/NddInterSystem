Class msg.realiserCommandeDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property marque As %String;

Property modele As %String;

Property couleur As %String;

Storage Default
{
<Data name="realiserCommandeDmdeDefaultData">
<Subscript>"realiserCommandeDmde"</Subscript>
<Value name="1">
<Value>marque</Value>
</Value>
<Value name="2">
<Value>modele</Value>
</Value>
<Value name="3">
<Value>couleur</Value>
</Value>
</Data>
<DefaultData>realiserCommandeDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
