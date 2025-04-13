import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { HeaderComponent } from "./header/header.component";
// import { HomeComponent } from "./home/home.component";
// import { ProjectsComponent } from "./projects/projects.component";
// import { CvDataComponent } from "./cv-data/cv-data.component";
import { RouterModule } from '@angular/router';
@Component({
  selector: 'app-root',
  imports: [RouterOutlet, HeaderComponent,RouterModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent {
  title = 'Resume';
}
