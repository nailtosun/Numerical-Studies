function out =fea_load(x ,Iref,Vc,modelName)

import com.comsol.model.*
import com.comsol.model.util.*


t1 = x(1);
t2 = x(2);
t3 = x(3);
t4 = x(4);
t5 = x(5);
t6 = x(6);
t7 = x(7);
t8 = x(8);
t9 = x(9);
t10 = x(10);
t11 = x(11);
t12 = x(12);
t13 = x(13);
t14 = x(14);
t15 = x(15);
t16 = x(16);


t1 = round(t1,5);
t2 = round(t2,5);
t3 = round(t3,5);
t4 = round(t4,5);
t5 = round(t5,5);
t6 = round(t6,5);
t7 = round(t7,5);
t8 = round(t8,5);
t9 = round(t9,5);
t10 = round(t10,5);
t11 = round(t11,5);
t12 = round(t12,5);
t13 = round(t13,5);
t14 = round(t14,5);
t15 = round(t15,5);
t16 = round(t16,5);

model = mphload(modelName, 'MyModel');

model.param.set('t1', t1);
model.param.set('t2', t2);
model.param.set('t3', t3);
model.param.set('t4', t4);
model.param.set('t5', t5);
model.param.set('t6', t6);
model.param.set('t7', t7);
model.param.set('t8', t8);
model.param.set('t9', t9);
model.param.set('t10', t10);
model.param.set('t11', t11);
model.param.set('t12', t12);
model.param.set('t13',t13);
model.param.set('t14', t14);
model.param.set('t15', t15);
model.param.set('t0', t16);

model.param.set('Vo', Vc);
model.param.set('Iref', Iref);
model.sol('sol1').run
Texit=mphglobal(model,"Texit");
out = [Texit(end)];