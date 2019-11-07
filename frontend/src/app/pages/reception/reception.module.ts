import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NbSelectModule, NbListModule, NbIconModule, NbButtonModule, NbCardModule, NbInputModule } from '@nebular/theme';
import { NgxEchartsModule } from 'ngx-echarts';
import { RouterModule } from '@angular/router';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { CheckInComponent } from './check-in/check-in.component';

@NgModule({
  imports: [
    CommonModule,
    NbListModule,
    NgxEchartsModule,
    RouterModule,
    NbCardModule,
    Ng2SmartTableModule,
    NbButtonModule,
    NbInputModule,
    NbSelectModule,
    NbIconModule
  ],
  declarations: [
    CheckInComponent
  ],
})
export class ReceptionModule { }
