public class UpdateBalancesAsset {
   @InvocableMethod
     public static void getdoAdd()
    
    {  
     system.debug('kjdakdakjhda');
     Asset Ast = [Select Prepaid_Balance__c,Plan__c,Voice_Balance__c,Data_Balance__c,SMS_Balance__c from Asset where Id =: '123213'];
     Decimal VoiceBal = Ast.Voice_Balance__c;
     Decimal DataBal = Ast.Data_Balance__c;
     Decimal SMSBal = Ast.SMS_Balance__c;
     Decimal PreBalance = Ast.Prepaid_Balance__c;
     system.debug(PreBalance);
     String PlanId = Ast.Plan__c;
     system.debug(PlanId);
     Plan__c Pln = [Select Data__c,SMS__c,Voice__c from Plan__c where Id =: PlanId];
     Decimal DataPer = Pln.Data__c;
     system.debug(DataPer);
     Decimal SMSPer = Pln.SMS__c;
     system.debug(SMSPer);
     Decimal VoicePer = Pln.Voice__c;
     system.debug(VoicePer);
     Decimal updVoiceBal = PreBalance*(VoicePer/100);
     Decimal updDataBal = PreBalance*(DataPer/100);
     Decimal updSMSBal = PreBalance*(SMSPer/100);
     Ast.Voice_Balance__c = updVoiceBal;
     Ast.Data_Balance__c = updDataBal;
     Ast.SMS_Balance__c = updSMSBal;
     Update Ast;
    }
    
    
}