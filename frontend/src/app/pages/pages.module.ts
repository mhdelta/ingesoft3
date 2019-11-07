import { NgModule } from '@angular/core';
import { NbMenuModule, NbCardModule, NbButtonModule, NbInputModule, NbSelectModule, NbIconModule } from '@nebular/theme';

import { ThemeModule } from '../@theme/theme.module';
import { PagesComponent } from './pages.component';
import { DashboardModule } from './dashboard/dashboard.module';
import { ECommerceModule } from './e-commerce/e-commerce.module';
import { PagesRoutingModule } from './pages-routing.module';
import { MiscellaneousModule } from './miscellaneous/miscellaneous.module';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { NgxEchartsModule } from 'ngx-echarts';
import { StatusCardComponent } from './dashboard/status-card/status-card.component';
import { ReceptionModule } from './reception/reception.module';

@NgModule({
  imports: [
    PagesRoutingModule,
    ThemeModule,
    NbMenuModule,
    DashboardModule,
    ECommerceModule,
    MiscellaneousModule,
    ReceptionModule
  ],
  declarations: [
    PagesComponent
  ],
})
export class PagesModule {
}
