import {Component, OnDestroy} from '@angular/core';
import { NbThemeService } from '@nebular/theme';
import { takeWhile } from 'rxjs/operators' ;
import { SolarData } from '../../@core/data/solar';

interface CardSettings {
  title: string;
  iconClass: string;
  type: string;
  link: string;
}

@Component({
  selector: 'ngx-dashboard',
  styleUrls: ['./dashboard.component.scss'],
  templateUrl: './dashboard.component.html',
})
export class DashboardComponent implements OnDestroy {

  private alive = true;

  solarValue: number;
  checkin: CardSettings = {
    title: 'Check In',
    iconClass: 'nb-lightbulb',
    type: 'primary',
    link: 'checkin'
  };
  checkout: CardSettings = {
    title: 'Check out',
    iconClass: 'nb-roller-shades',
    type: 'danger',
    link: 'checkout'
  };
  servicios_hab: CardSettings = {
    title: 'Servicios a la habitación',
    iconClass: 'nb-audio',
    type: 'info',
    link: 'roomservices'
  };
  informacion: CardSettings = {
    title: 'Información de eventos',
    iconClass: 'nb-coffee-maker',
    type: 'warning',
    link: 'nearinfo'
  };

  statusCards: string;

  commonStatusCardsSet: CardSettings[] = [
    this.checkin,
    this.checkout,
    this.servicios_hab,
    this.informacion,
  ];

  statusCardsByThemes: {
    default: CardSettings[];
    cosmic: CardSettings[];
    corporate: CardSettings[];
    dark: CardSettings[];
  } = {
    default: this.commonStatusCardsSet,
    cosmic: this.commonStatusCardsSet,
    corporate: [
      {
        ...this.checkin,
        type: 'warning',
      },
      {
        ...this.checkout,
        type: 'primary',
      },
      {
        ...this.servicios_hab,
        type: 'danger',
      },
      {
        ...this.informacion,
        type: 'info',
      },
    ],
    dark: this.commonStatusCardsSet,
  };

  constructor(private themeService: NbThemeService,
              private solarService: SolarData) {
    this.themeService.getJsTheme()
      .pipe(takeWhile(() => this.alive))
      .subscribe(theme => {
        this.statusCards = this.statusCardsByThemes[theme.name];
    });

    this.solarService.getSolarData()
      .pipe(takeWhile(() => this.alive))
      .subscribe((data) => {
        this.solarValue = data;
      });
  }

  ngOnDestroy() {
    this.alive = false;
  }
}
