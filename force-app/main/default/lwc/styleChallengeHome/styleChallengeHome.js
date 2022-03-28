import { LightningElement } from 'lwc';

export default class StyleChallengeHome extends LightningElement {
    get tripTypeOptions() {
        return [
            { label: 'Round trip', value: 'option1' },
            { label: 'One Way', value: 'option2' },
            { label: 'Multi City', value: 'option3' }
        ];
    }
}
