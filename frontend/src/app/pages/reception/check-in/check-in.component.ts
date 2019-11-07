import { Component, OnInit, TemplateRef } from '@angular/core';
import { NbIconLibraries, NbDialogService, NbToastrService } from '@nebular/theme';

@Component({
  selector: 'ngx-check-in',
  templateUrl: './check-in.component.html',
  styleUrls: ['./check-in.component.scss']
})
export class CheckInComponent implements OnInit {

  srcEnums = sourcesEnum;
  showReservations = false;
  selectedRoom
  selectedUsers = []
  idResponsable = 0
  arriveDate = new Date().toLocaleString();
  leaveDate = new Date().toLocaleString();

  baseSettings = {
    actions: false,
    columns: {
      id: {
        title: 'id',
        type: 'number',
      }
    },
  };
  roomSettings = {
    ...this.baseSettings,
    columns: {
      ...this.baseSettings.columns,
      description: {title: 'Descripción',
      type: 'string'}
    }
  }
  userSettings = {
    ...this.baseSettings,
    columns: {
      ...this.baseSettings.columns,
      name: {
        title: 'Nombre',
        type: 'string'
      },
      age: {
        title: 'Edad',
        type: 'number'
      },
    }
  }
  rooms = [
      {
        id: 1,
        description: "A1",
      },
      {
        id: 2,
        description: "A2",
      }
  ];
  reservations = [
    {
      id: 1,
      userId: 1

    }
  ];
  users = [
    {
      id: 1,
      name: 'Miguel',
      age: 23,
    },
    {
      id: 2,
      name: 'Haily',
      age: 18,
    }
  ];
  constructor(
    iconsLibrary: NbIconLibraries,
    private dialogService: NbDialogService,
    private toastrService: NbToastrService
  ) {
    iconsLibrary.registerFontPack('fa', { packClass: 'fa', iconClassPrefix: 'fa' });
   }

  ngOnInit() {
  }

  open(dialog: TemplateRef<any>, src) {
    let context = {};
    context = {
      title: sourcesEnum[src],
      data: src == sourcesEnum.users ? this.users : this.rooms,
      settings: src == sourcesEnum.users ? this.userSettings : this.roomSettings,
      src: src,
      dialog
    }
    this.dialogService.open(dialog, {
      context
    });
  }

  onRowSelect(event, src, dialog: any): void {
    if (src == sourcesEnum.rooms) {
      this.selectedRoom = event.data;
      this.toastrService.show('Se asignó la habitación');
    }

    if (src == sourcesEnum.users) {
      if (!this.selectedUsers.includes(event.data)) {
        if (this.selectedUsers.length == 0) {
          this.idResponsable = event.data.id;
        }
        this.selectedUsers.push(event.data);
        this.toastrService.show('Se agregó el usuario');
      } else {
        this.toastrService.show('Ya se había agregado el usuario', '', {
          status: "danger"
        });
      }
    }
  }

  deleteUser(user) {
      this.selectedUsers = this.selectedUsers.filter(x => x.id != user.id)          
  }
  getBckgroundColor(isResponsible) {
    if (isResponsible) {
      return '#29bdb6'
    }
  }

  createArrival() {
    this.selectedRoom = null;
    this.selectedUsers = [];
    this.idResponsable = 0;
    this.leaveDate = new Date().toLocaleString();
    this.toastrService.show('La entrada se creó correctamente', '', {
      status: 'success'
    })
  }
}

export enum sourcesEnum {
  users = 0,
  rooms = 1
}
