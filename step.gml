function scr_movimento_topdown() {

	var up = keyboard_check(ord("W"));
	var left = keyboard_check(ord("A"));
	var down = keyboard_check(ord("S"));
	var right = keyboard_check(ord("D"));

	//Ajustando o Movimento para as 8 Direções sem somar velocidade!!
	//Descobrir para qual direção estou me movendo
	//Checando se o usuário está apertando alguma coisa
	if (up or down or left or right) {
	    move_dir = point_direction(0, 0, (right-left), (down-up));
	    velo = max_vel;
	}
	else {
	    velo = 0;
	}

	//Com base na minha direção irei dar minha velocidade
	velh = lengthdir_x(velo, move_dir);
	velv = lengthdir_y(velo, move_dir);

	//Sistema de Colisão e Movimento Horizontal
	var _velh = sign(velh); //Ele retorna 1, -1 ou 0

	//Deixar o Velh positivo sempre (pois ele nao repete valores negativos)
	repeat(abs(velh)) {
	    //Checar se o espaço para onde vou me mover tem alguem
	    if (place_meeting(x + _velh, y, obj_block)) {
	        //O que fazer se colidi com alguem?
	        velh = 0;
	    }
	    else {	//Se eu NAO colidi com alguem
	        //Eu posso me mover
	        x += _velh;
	    }
	}

	//Sistema de Colisão e Movimento Vertical
	var _velv = sign(velv); //Ele retorna 1, -1 ou 0

	//Deixar o Velh positivo sempre (pois ele nao repete valores negativos)
	repeat(abs(velv)) {
	    //Checar se o espaço para onde vou me mover tem alguem
	    if (place_meeting(x, y + _velv, obj_block)) {
	        //O que fazer se colidi com alguem?
	        velv = 0;
	    }
	    else {	 //Se eu NAO colidi com alguem
	        //Eu posso me mover
	        y += _velv;
	    }
	}
}
