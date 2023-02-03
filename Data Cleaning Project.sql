/*

Cleaning Data in SQL Queries

*/



Select*
From DataCleaningProject.dbo.NashData



-----------------------------------------------------------------------------------------

-- Standardize Data Format


Select SaleDateConverted, Convert(Date,SaleDate)
From dbo.NashData


Update NashData
Set SaleDate = Convert(Date,SaleDate)

-- If it doesn't Update properly

Alter Table NashData
Add SaleDateConverted Date;

Update NashData
Set SaleDateConverted = Convert(Date,SaleDate)



-----------------------------------------------------------------------------------------


-- Populate Property Address data


Select *
From dbo.NashData
Order By ParcelID;



Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, IsNull(a.PropertyAddress,b.PropertyAddress)
From dbo.NashData a 
Join dbo.NashData b
	On a.ParcelID = b.ParcelID
	And a.[UniqueID] <> b.[UniqueID]
Where a.PropertyAddress is null;



Update a
Set PropertyAddress = IsNull(a.PropertyAddress,b.PropertyAddress)
From dbo.NashData a 
Join dbo.NashData b
	On a.ParcelID = b.ParcelID
	And a.[UniqueID] <> b.[UniqueID]
Where a.PropertyAddress is null;


-----------------------------------------------------------------------------------------


-- Breaking Out Address into Individual Columns (Address, City, State)



Select
Substring(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) - 1 ) As Address
, Substring(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress)) As Address
From dbo.NashData;




Alter Table NashData
Add PropertySplitAddress Nvarchar(255);

Update NashData
Set PropertySplitAddress = Substring(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) - 1 )




Alter Table NashData
Add PropertySplitCity Nvarchar(255);

Update NashData
Set PropertySplitCity = Substring(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress))




Select *
From dbo.NashData;




Select OwnerAddress
From dbo.NashData;


Select
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3)
,PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)
,PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)
From dbo.NashData;




Alter Table NashData
Add OwnerSplitAddress Nvarchar(255);

Update NashData
Set OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3)




Alter Table NashData
Add OwnerSplitCity Nvarchar(255);

Update NashData
Set OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)




Alter Table
Add OwnerSplitState Nvarchar(255);

Update NashData
Set OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)




Select *
From dbo.NashData


-----------------------------------------------------------------------------------------


-- Change Y and N to Yes and No 'Sold as Vacant" Field


Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From dbo.NashData
Group by SoldAsVacant
Order by 2


Select SoldAsVacant
, CASE When SoldAsVacant = 'Y' Then 'Yes'
		When SoldAsVacant = 'N' Then 'No'
		Else SoldAsVacant
		END
From dbo.NashData

Update dbo.NashData
Set SoldAsVacant = CASE When SoldAsVacant = 'Y' Then 'Yes'
		When SoldAsVacant = 'N' Then 'No'
		Else SoldAsVacant
		END


-----------------------------------------------------------------------------------------


-- Remove Duplicates


With RowNumCTE As(
Select *,
	Row_Number() Over (
	Partition By ParcelID,
				PropertyAddress,
				SalePrice,
				SaleDate,
				LegalReference
				Order by
				UniqueID
				) As row_num
From dbo.NashData
--Order By ParcelID
)
Select *
From RowNumCTE
Where row_num > 1
Order By PropertyAddress

Select *
From dbo.NashData


-----------------------------------------------------------------------------------------


-- Delete Unused Columns


Select *
From dbo.NashData


Alter Table dbo.NashData
Drop Column OwnerAddress, TaxDistrict, PropertyAddress, SaleDate
