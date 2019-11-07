import { Component, Input } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'ngx-status-card',
  styleUrls: ['./status-card.component.scss'],
  template: `
    <nb-card (click)="navigate(link)" [ngClass]="{'off': on}">
      <div class="icon-container">
        <div class="icon status-{{ type }}">
          <ng-content></ng-content>
        </div>
      </div>

      <div class="details">
        <div class="title h5">{{ title }}</div>
      </div>
    </nb-card>
  `,
})
export class StatusCardComponent {

  @Input() title: string;
  @Input() type: string;
  @Input() link: string;
  
  constructor(
    private router: Router
  ) {}

  navigate(link) {
    this.router.navigate(['/pages/'+link]);
  }
}
