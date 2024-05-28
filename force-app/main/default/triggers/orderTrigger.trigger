/**
 * @name orderTrigger
 * @description
**/
trigger orderTrigger on Order (
    After update
) {
    if ( Trigger.new != null){
        OrderHelper.AfterUpdate(Trigger.new, Trigger.old);
    }
}