import { ProjectsComponent } from './projects/projects.component';
import { Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { CvDataComponent } from './cv-data/cv-data.component';

export const routes: Routes = [
  {
    path: '',
    component: HomeComponent
  },
  {
    path: 'project',
    component:ProjectsComponent
  }
  ,
  {
    path:'Experience',
    component: CvDataComponent
  }
];
