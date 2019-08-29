package services;

import dao.DBHandler;
import enums.DataTypes;
import model.Receiving;
import model.RunningBalanceProduct;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReceivingService implements ServiceInterface<Receiving> {
    private RunningBalanceProductService runningBalanceProductService = new RunningBalanceProductService();

    @Override
    public boolean create(Receiving receiving) throws SQLException {
        String query = "INSERT INTO receiving(batchNo,date,productId,quantity,buyingPrice,sellingPrice,userId) values(?,NOW(),?,?,?,?,?)";
        DataTypes[] dataTypes = new DataTypes[6];
        Object[] params = new Object[6];

        params[0]= receiving.getBatchNo();
        params[1]= receiving.getProductId();
        params[2]= receiving.getQuantity();
        params[3]= receiving.getBuyingPrice();
        params[4]= receiving.getSellingPrice();
        params[5]= receiving.getUserId();

        dataTypes[0] = DataTypes.INTEGER;
        dataTypes[1] = DataTypes.INTEGER;
        dataTypes[2] = DataTypes.INTEGER;
        dataTypes[3] = DataTypes.DOUBLE;
        dataTypes[4] = DataTypes.DOUBLE;
        dataTypes[5] = DataTypes.INTEGER;


        RunningBalanceProduct runningBalanceProduct;
        try {
            if(runningBalanceProductService.isProductHavingRunningBalance(receiving.getProductId())){
                runningBalanceProduct = runningBalanceProductService.getRunningBalanceProduct(receiving.getProductId());
                runningBalanceProduct.setRunningBalance(runningBalanceProduct.getRunningBalance()+receiving.getQuantity());
                if(runningBalanceProductService.updateRunningBalanceProduct(runningBalanceProduct) &&DBHandler.getInstance().executeAction(query,params,dataTypes)){
                    DBHandler.getInstance().commitChanges();
                    return true;
                }
            }else{
                runningBalanceProduct = new RunningBalanceProduct(receiving.getProductId(),receiving.getQuantity());
                if(runningBalanceProductService.create(runningBalanceProduct) && DBHandler.getInstance().executeAction(query,params,dataTypes)){
                    DBHandler.getInstance().commitChanges();
                    return true;
                }

            }
        } catch (SQLException e) {
            DBHandler.getInstance().rollbackChanges();
            e.printStackTrace();
            return false;
        }
        return false;
    }

    @Override
    public Receiving read(int id) throws SQLException {
        DataTypes[] dataTypes = new DataTypes[1];
        Object[] params = new Object[1];
        String query = "SELECT * FROM receiving WHERE productId=? LIMIT 1";
        dataTypes[0]=DataTypes.INTEGER;
        params[0]= id;

        ResultSet rs = DBHandler.getInstance().executeQuery(query,params,dataTypes);
        Receiving receiving = null;
        if (rs.next()) {
            receiving = new Receiving();
            setReceivingObject(rs, receiving);
        }
        return receiving;
    }

    public ArrayList<Receiving> getReceivings() throws SQLException {
        String query = "SELECT * FROM receiving";
        ResultSet rs = DBHandler.getInstance().executeQuery(query,null,null);
        ArrayList<Receiving> receivingList = new ArrayList<>();
        while (rs.next()) {
            Receiving receiving = new Receiving();
            setReceivingObject(rs, receiving);
            receivingList.add(receiving);

        }
        return receivingList;

    }

    private void setReceivingObject(ResultSet rs, Receiving receiving) throws SQLException {
        receiving.setReceiveId(rs.getInt("receiveId"));
        receiving.setBatchNo(rs.getInt("batchNo"));
        receiving.setDate(rs.getDate("date"));
        receiving.setProductId(rs.getInt("productId"));
        receiving.setQuantity(rs.getInt("quantity"));
        receiving.setBuyingPrice(rs.getDouble("buyingPrice"));
        receiving.setSellingPrice(rs.getDouble("sellingPrice"));
    }
    @Override
    public boolean update(Receiving receiving) throws SQLException {
      return false;
    }
    @Override
    public boolean delete(Receiving receiving) throws SQLException {
      return false;
    }

}
