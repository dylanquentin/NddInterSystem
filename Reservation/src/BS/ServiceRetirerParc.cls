Class BS.ServiceRetirerParc Extends Ens.BusinessService
{

/// Name of the WebService
Parameter SERVICENAME = "ServiceRetirerParc";

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{
    set tsc = $CASE(pHint,
        "retirer":..retirer(pInput,.pOutput),
	 	: $$$ERROR($$$NotImplemented)
    )
    Quit tsc
}

Method retirer(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    set tsc = ..SendRequestSync("parcProcess",pInput,.pOutput)
    Quit $$$OK
}

}
