import {FormElementStatusBuilder} from "rules-config/rules";

export default class {
    constructor() {
        this._getStatusBuilder = this._getStatusBuilder.bind(this);
    }

    reasonForDroppingAsPerTeacher(programEncounter, formElement) {
        let statusBuilder = this._getStatusBuilder(programEncounter, formElement);
        statusBuilder.show().when.addressType.equals("School")
            .or.when.addressType.equals("Boarding");
        return statusBuilder.build();
    }

    otherReasonAccordingToStudentParent(programEncounter, formElement) {
        let statusBuilder = this._getStatusBuilder(programEncounter, formElement);
        statusBuilder.show()
            .when.valueInEncounter("Reason for dropping as per student / parent").containsAnswerConceptName("Other");
        return statusBuilder.build();
    }

    otherReasonAccordingToTeacher(programEncounter, formElement) {
        let statusBuilder = this._getStatusBuilder(programEncounter, formElement);
        statusBuilder.show()
            .when.valueInEncounter("Reason for dropping as per teacher").containsAnswerConceptName("Other");
        return statusBuilder.build();
    }

    otherActivityPleaseSpecify(programEncounter, formElement) {
        let statusBuilder = this._getStatusBuilder(programEncounter, formElement);
        statusBuilder.show()
            .when.valueInEncounter("What he/she is doing now?").containsAnswerConceptName("Other")
        return statusBuilder.build();
    }

    nameOfSchool(programEncounter, formElement) {
        let statusBuilder = this._getStatusBuilder(programEncounter, formElement);
        statusBuilder.show()
            .when.valueInEncounter("Are you ready for re-admission to school").is.yes
        return statusBuilder.build();
    }

    _getStatusBuilder(programEncounter, formElement) {
        return new FormElementStatusBuilder({
            programEncounter: programEncounter,
            formElement: formElement,
        });
    }
}