%Please run SimpleLP.m before running this script
House_num=5;
for i = 1:House_num
    figure(1)
    s11(i) = subplot(1,House_num,i);
    
    bar(t,-value(discharge_power(i,:))*1000,'stacked','b')
    hold on
    bar(t,value(charge_sequence(i,:))*P_batt_charge_pu*1000,'stacked','g')
    hold on
    plot(t, Load_matrix(i,:)*1000,'r')
    legend('discharge','charge','Load(Exclude Battery)')
    str = ['power of battery house ',num2str(i), ' [kWh]'];
    ylabel(s11(i),str)
    xlabel('time[h]')
    axis([0 23 -10 10])
    grid on

    
    figure(2)
    s2(i) = subplot(1,House_num,i);
    plot(t,value(SoC(i,:)))
    str = ['Battery of house ',num2str(i), ' [kWh]'];
    hold on
    plot(t, value(E_batt_max(i)*ones(1,24)),'r')
    legend('SoC','Battery Capacity')
    ylabel(s2(i),str)
    xlabel('time[h]')
    grid on
    axis([0 23 0 max(value(E_batt_max))+3]);
    
end

figure(3)
subplot(2,1,1)
plot(t,value(P_transformer_max)*1000, 'r')
hold on
plot(t, sum(Load_matrix)*1000,'b')
legend('Transformer Power','Total Load(Excude Battery Charge)')
ylabel('Power[kW]')
xlabel('time[h]')
axis([0 23 0 max(value(P_transformer_max))*1000+10])
grid on
subplot(2,1,2)
bar(t,Power_supply)
ylabel('Power Supply (Binary)')
xlabel('time[h]')
axis([0 23 0 1])

%figure(4)