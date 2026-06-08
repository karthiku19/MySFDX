import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountListController.getAccounts';

const AVATAR_COLORS = ['#0070d2', '#7b5ea7', '#e45b45', '#2e844a', '#e07b00'];

const RATING_CONFIG = {
    Hot:  { cls: 'rating-hot',  icon: '🔥' },
    Warm: { cls: 'rating-warm', icon: '🌞' },
    Cold: { cls: 'rating-cold', icon: '❄️' }
};

export default class MyAccountList extends LightningElement {
    @track accounts = [];
    totalCount = 0;
    error;
    isLoading = true;

    @wire(getAccounts)
    wiredAccounts({ data, error }) {
        this.isLoading = false;
        if (data) {
            this.accounts = data.accounts.map((acc, idx) => {
                const ratingCfg = RATING_CONFIG[acc.Rating] || { cls: '', icon: '' };
                return {
                    Id: acc.Id,
                    Name: acc.Name,
                    Industry: acc.Industry || '—',
                    Phone: acc.Phone || '—',
                    avatarLetter: acc.Name ? acc.Name.charAt(0).toUpperCase() : '?',
                    avatarStyle: `background-color: ${AVATAR_COLORS[idx % AVATAR_COLORS.length]}`,
                    formattedRevenue: acc.AnnualRevenue
                        ? '$' + Number(acc.AnnualRevenue).toLocaleString('en-US')
                        : 'N/A',
                    Rating: acc.Rating || '—',
                    ratingClass: `rating-badge ${ratingCfg.cls}`,
                    ratingIcon: ratingCfg.icon
                };
            });
            this.totalCount = data.totalCount;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.accounts = [];
        }
    }

    get hasAccounts() {
        return this.accounts.length > 0;
    }

    get displayCount() {
        return this.accounts.length;
    }
}
