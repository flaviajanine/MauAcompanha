import { Component, OnInit, NgModule, Pipe, } from '@angular/core';
import { ReactiveFormsModule, 
          FormsModule, 
          FormGroup, 
          FormControl, 
          Validators } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { NomeValidators } from './../../../common/validators/nome.validators';
import { CadastroService } from './../../../services/cadastro.service';
import { Router } from '@angular/router';


// decorator 
@Component({
  selector: 'page-sign-up-1',
  // o html associado a esse componente
  templateUrl: './sign-up-1.component.html',
  styleUrls: ['./sign-up-1.component.scss']

})

// aqui é onde vão as propertys e as dependencies injections 
export class PageSignUp1Component implements OnInit {

  body: any[];
  form: FormGroup;
  nome: FormControl;
  sobrenome: FormControl;
  email: FormControl;
  senha: FormControl;
  confirmsenha: FormControl;
  
    ngOnInit() { 
      this.createFormControls();
      this.createForm();     
  }
  
 constructor(private service: CadastroService,
             private router: Router) {}
    
 
    onSubmit() {
     let body = this.form.value;
     
    this.service.create(body)
    .subscribe( postbody => {
      body = postbody;
      alert('Cadastrado com sucesso!');
      this.router.navigate(['/extra-layout/sign-in-social']);
    },
    error => {
      alert('Erro!');      
  });


    }    
    

    createForm(){
      this.form = new FormGroup({
        nome: this.nome,
        sobrenome: this.sobrenome,
        email: this.email,
        senha: this.senha,
        confirmsenha: this.confirmsenha
      })
    }

    createFormControls(){
        this.nome = new FormControl('', Validators.required);
        this.sobrenome = new FormControl('', Validators.required);
        this.email = new FormControl('', Validators.email);
        this.senha = new FormControl('', Validators.minLength(6));
        this.confirmsenha = new FormControl('', Validators.minLength(6));
    }

    
}

