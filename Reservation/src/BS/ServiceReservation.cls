Class BS.ServiceReservation Extends Ens.BusinessService
{

/// Name of the WebService
Parameter SERVICENAME = "ServiceReservation";

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{
    set tsc = $CASE(pHint,
        "reserver":..reserver(pInput,.pOutput),
	 	: $$$ERROR($$$NotImplemented)
    )
    Quit tsc
}

Method reserver(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    set tsc = ..SendRequestSync("reservationProcess",pInput,.pOutput)
    Quit $$$OK
}

}
