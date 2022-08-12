var up, down, left, right;

up = leyboard_check(ord("W"));
left = leyboard_check(ord("A"));
down = leyboard_check(ord("S"));
right = leyboard_check(ord("D"));

//Ajustando o Movimento para as 8 Direções sem somar velocidade!!
//Descobrir para qual direção estou me movendo
//Checando se o usuário está apertando alguma coisa
if (up or down or left or right)
{
    move_dir = point_direction(0, 0, (right-keft), (down-up));
    vel = max_vel;
}
else
{
    vel = 0;
}

//Com base na minha direção irei dar minha velocidade
velh = lengthdir_x(vel, move_dir);
velv = lengthdir_y(vel, move_dir);

//Sistema de Colisão e Movimento Horizontal
var velh = sign(velh); //Ele retorna 1, -1 ou 0

//Deixar o Velh positivo sempre (pois ele nao repete valores negativos)
repeat(abs(velh))
{
    //Checar se o espaço para onde vou me mover tem alguem
    if (place meeting(x + velh, y, obj_colisao))
    {
        //O que fazer se colidi com alguem?
        velh = 0;
    }
    else //Se eu NAO colidi com alguem
    {
        //Eu posso me mover
        x += _velv;
    }
}

//Sistema de Colisão e Movimento Vertical
var velv = sign(velv); //Ele retorna 1, -1 ou 0

//Deixar o Velh positivo sempre (pois ele nao repete valores negativos)
repeat(abs(velv))
{
    //Checar se o espaço para onde vou me mover tem alguem
    if (place meeting(x, y + velv, obj_colisao))
    {
        //O que fazer se colidi com alguem?
        velv = 0;
    }
    else //Se eu NAO colidi com alguem
    {
        //Eu posso me mover
        y += _velv;
    }
}